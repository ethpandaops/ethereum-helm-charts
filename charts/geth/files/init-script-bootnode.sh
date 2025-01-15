#!/bin/sh

# Step 1: Define the URL for the bootnode binary
echo "Downloading bootnode binary..."
BOOTNODE_URL="https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.14.12-293a300d.tar.gz"

NODEKEY_PATH="/data/network/$HOSTNAME/nodekey"
STOP_FILE="/data/stop-bootnode"
ENODE_URL_PATH="/data/network/$HOSTNAME/enode.url"

rm $STOP_FILE
rm -rf /data/network/$HOSTNAME
mkdir -p /data/network/$HOSTNAME

rm -rf /data/scripts/$HOSTNAME
mkdir -p /data/scripts/$HOSTNAME

# Step 2: Download the bootnode binary
curl -L $BOOTNODE_URL -o /tmp/geth-tools.tar.gz

# Step 3: Extract the bootnode binary
echo "Extracting bootnode binary..."
tar -xvzf /tmp/geth-tools.tar.gz -C /tmp

ls -lrt /tmp

chmod +x /tmp/geth-alltools-linux-amd64-1.14.12-293a300d/bootnode
ls -lrt /tmp/geth-alltools-linux-amd64-1.14.12-293a300d/bootnode

# Step 5: Generate the nodekey if it doesn't exist

if [ ! -f "$NODEKEY_PATH" ]; then
  echo "Generating new nodekey..."
  /tmp/geth-alltools-linux-amd64-1.14.12-293a300d/bootnode -genkey "$NODEKEY_PATH"
  echo "New nodekey generated at $NODEKEY_PATH."
  ls -lrt $NODEKEY_PATH
fi

cp /tmp/geth-alltools-linux-amd64-1.14.12-293a300d/bootnode /data/scripts/$HOSTNAME/bootnode
chmod +x /data/scripts/$HOSTNAME/bootnode

ls -lrt /data/scripts/$HOSTNAME/bootnode

echo "Starting bootnode on port 30303..."

geth init --datadir "/data/network/${HOSTNAME}" /config/genesis.json

# Get the pod's IP
POD_IP=$(hostname -i)

geth --datadir "/data/network/${HOSTNAME}" \
  --nodekey "${NODEKEY_PATH}" \
  --networkid 999999 \
  --nat "extip:${POD_IP}" \
  --port 30303 \
  --verbosity 5 \
  --ipcpath /tmp/geth.ipc
