#!/bin/sh

echo "running script init-config"

echo "HOSTNAME: $HOSTNAME"

rm -rf /data/network/$HOSTNAME
echo "Removed /data/network/$HOSTNAME"
mkdir -p /data/network/$HOSTNAME
echo "Created /data/network/$HOSTNAME"
mkdir -p /data/stateFiles
echo "Created /data/stateFiles"

ls -lrt /data

# Create the genesis state only if it doesn't already exist
if [ ! -f /data/stateFiles/genesis.ssz ] || [ ! -f /data/stateFiles/genesis-out.json ]; then
  echo "Genesis state files not found. Creating..."

  # Download prysmctl if not already available
  if [ ! -f /usr/local/bin/prysmctl ]; then
    echo "Downloading prysmctl..."
    curl -L https://github.com/prysmaticlabs/prysm/releases/download/v5.2.0/prysmctl-v5.2.0-linux-amd64 -o /usr/local/bin/prysmctl
    chmod +x /usr/local/bin/prysmctl
  fi

  # Check if prysmctl is executable
  ls -lrt /usr/local/bin/prysmctl

  echo "Creating the genesis state using the provided genesis.json and config.yml..."

  GENESIS_TIME=${GENESIS_TIME:-1736642736}

  # Run prysmctl to generate the genesis state
  /usr/local/bin/prysmctl testnet generate-genesis \
    --num-validators=1 \
    --chain-config-file=/config/config.yml \
    --geth-genesis-json-in=/config/genesis.json \
    --output-ssz=/data/stateFiles/genesis.ssz \
    --geth-genesis-json-out=/data/stateFiles/genesis-out.json \
    --genesis-time="$GENESIS_TIME"

  echo "Genesis state files created successfully."

else
  echo "Genesis state files already exist. Skipping creation."
fi

# Output a confirmation that the files are in place
ls -lrt /data/stateFiles/genesis.ssz /data/stateFiles/genesis-out.json

geth init --datadir=/data/network/$HOSTNAME /data/stateFiles/genesis-out.json

