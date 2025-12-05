#!/bin/bash

# Update ethereum-node Chart.yaml dependencies to use the latest versions from local charts

set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
ETHEREUM_NODE_CHART="${REPO_ROOT}/charts/ethereum-node/Chart.yaml"
CHARTS_DIR="${REPO_ROOT}/charts"

if [ ! -f "${ETHEREUM_NODE_CHART}" ]; then
    echo "Error: ethereum-node Chart.yaml not found at ${ETHEREUM_NODE_CHART}"
    exit 1
fi

echo "Updating ethereum-node dependencies to latest versions..."

# Track if any changes were made
CHANGES_MADE=0

# Create a temporary file
TMP_FILE=$(mktemp)

# Read the Chart.yaml and update dependency versions
awk -v charts_dir="${CHARTS_DIR}" '
BEGIN {
    in_dependencies = 0
    current_dep = ""
    changes = 0
}
/^dependencies:/ {
    in_dependencies = 1
    print
    next
}
/^- name:/ {
    if (in_dependencies) {
        # Extract the chart name
        chart_name = $3
        current_dep = chart_name

        # Check if the chart exists locally
        chart_yaml = charts_dir "/" chart_name "/Chart.yaml"

        # Try to read the version from the local chart
        version_cmd = "grep \"^version:\" " chart_yaml " 2>/dev/null | head -1 | awk \"{print \\$2}\" | tr -d \"\\\"\""
        version_cmd | getline version
        close(version_cmd)

        if (version != "") {
            stored_versions[chart_name] = version
        }
    }
    print
    next
}
/^  version:/ {
    if (in_dependencies && current_dep != "" && current_dep in stored_versions) {
        old_version = $2
        gsub(/"/, "", old_version)
        new_version = stored_versions[current_dep]

        if (old_version != new_version) {
            printf "  version: \"%s\"\n", new_version
            printf "Updated %s: %s -> %s\n", current_dep, old_version, new_version > "/dev/stderr"
            changes = 1
        } else {
            print
            printf "%s: %s (no change)\n", current_dep, new_version > "/dev/stderr"
        }
        current_dep = ""
        next
    }
}
/^[a-zA-Z]/ {
    # Reset when we hit a new top-level key
    if (in_dependencies && !/^  /) {
        in_dependencies = 0
    }
}
{
    print
}
END {
    exit changes
}
' "${ETHEREUM_NODE_CHART}" > "${TMP_FILE}" || AWK_EXIT_CODE=$?

# Check if changes were made (awk exits with 1 if changes > 0)
if [ ${AWK_EXIT_CODE:-0} -eq 1 ]; then
    CHANGES_MADE=1
fi

# Replace the original file
mv "${TMP_FILE}" "${ETHEREUM_NODE_CHART}"

echo "✓ Dependencies updated successfully"

# If changes were made, bump the ethereum-node chart version
if [ ${CHANGES_MADE} -eq 1 ]; then
    echo ""
    echo "Bumping ethereum-node chart version..."

    # Get current version
    CURRENT_VERSION=$(grep "^version:" "${ETHEREUM_NODE_CHART}" | head -1 | awk '{print $2}' | tr -d '"')

    if [ -z "${CURRENT_VERSION}" ]; then
        echo "Error: Could not read current version from ${ETHEREUM_NODE_CHART}"
        exit 1
    fi

    # Parse version (assuming semver: major.minor.patch)
    IFS='.' read -r MAJOR MINOR PATCH <<< "${CURRENT_VERSION}"

    # Increment patch version
    NEW_PATCH=$((PATCH + 1))
    NEW_VERSION="${MAJOR}.${MINOR}.${NEW_PATCH}"

    # Update the version in Chart.yaml using awk
    TMP_VERSION_FILE=$(mktemp)
    awk -v old_ver="${CURRENT_VERSION}" -v new_ver="${NEW_VERSION}" '
    /^version:/ && !updated {
        print "version: " new_ver
        updated = 1
        next
    }
    {print}
    ' "${ETHEREUM_NODE_CHART}" > "${TMP_VERSION_FILE}"

    mv "${TMP_VERSION_FILE}" "${ETHEREUM_NODE_CHART}"

    echo "✓ Bumped ethereum-node version: ${CURRENT_VERSION} -> ${NEW_VERSION}"

    # Update Chart.lock file
    echo ""
    echo "Updating Chart.lock for ethereum-node..."

    ETHEREUM_NODE_DIR="${REPO_ROOT}/charts/ethereum-node"

    if command -v helm >/dev/null 2>&1; then
        cd "${ETHEREUM_NODE_DIR}"

        # Remove old Chart.lock to force regeneration
        rm -f Chart.lock

        # Update dependencies - this will download from remote but update Chart.lock with correct versions
        helm dependency update > /dev/null 2>&1

        if [ $? -eq 0 ]; then
            echo "✓ Chart.lock updated successfully"
        else
            echo "⚠ Warning: helm dependency update failed"
            exit 1
        fi
    else
        echo "⚠ Warning: helm command not found. Chart.lock not updated."
        echo "Please run 'helm dependency update' manually in charts/ethereum-node/"
    fi
else
    echo "No dependency changes detected, ethereum-node version unchanged"
fi
