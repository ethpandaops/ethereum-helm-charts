#!/usr/bin/env bash
#
# Package every chart changed since a base ref, the same way the release
# workflow does (helm dependency build + helm package).
#
# `ct lint` / `ct install` never package charts, so packaging-only failures —
# e.g. a dependency stripped by a chart's .helmignore, or an unresolvable
# dependency — otherwise surface only in the release job on master, after merge,
# where they silently block publishing. Running this on the PR catches them.
#
# Usage: package-changed-charts.sh [base-ref]   # base-ref defaults to "master"
set -euo pipefail

base="${1:-master}"
out="$(mktemp -d)"

# Top-level chart directories touched since the base ref (e.g. "charts/dora").
changed_charts() {
  git diff --find-renames --name-only "$base" -- charts |
    cut -d/ -f1-2 |
    sort -u
}

# The external (http) repositories a chart declares as dependencies. These come
# from the chart's own Chart.yaml, so there is no hardcoded repo list to keep in
# sync as charts come and go.
chart_dependency_repos() {
  helm dependency list "$1" 2>/dev/null |
    awk 'NR > 1 && $3 ~ /^https?:\/\// { print $3 }' |
    sort -u
}

for chart in $(changed_charts); do
  [[ -f "$chart/Chart.yaml" ]] || continue

  while read -r repo; do
    # The local repo name is arbitrary (helm resolves dependencies by URL); a
    # hash of the URL keeps it unique and deterministic.
    helm repo add "dep-$(cksum <<<"$repo" | cut -d' ' -f1)" "$repo" >/dev/null 2>&1 || true
  done < <(chart_dependency_repos "$chart")

  echo "==> Packaging $chart"
  helm dependency build "$chart"
  helm package "$chart" --destination "$out"
done
