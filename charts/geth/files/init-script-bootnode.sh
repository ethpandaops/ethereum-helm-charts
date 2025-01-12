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

# Get the pod's IP
POD_IP=$(hostname -i)

# Generate the enode URL with the correct IP address
ENODE_URL=$(/data/scripts/$HOSTNAME/bootnode \
  -nodekey "$NODEKEY_PATH" \
  -addr "$POD_IP:30303" \
  -writeaddress)

echo "enode://${ENODE_URL}@${POD_IP}:30303" > "$ENODE_URL_PATH"
echo "Bootnode started with enode: $(cat $ENODE_URL_PATH)"

POD_IP=$(hostname -i)

exec /data/scripts/$HOSTNAME/bootnode \
  -nodekey "$NODEKEY_PATH" \
  -addr "${POD_IP}:30303" \
  -nat "extip:${POD_IP}" \
  -verbosity 5

# Wait for stop file to gracefully exit
echo "Waiting for stop file at $STOP_FILE..."
while [ ! -f "$STOP_FILE" ]; do
  sleep 5
done

echo "Stop file detected. Shutting down bootnode."
kill $(jobs -p)