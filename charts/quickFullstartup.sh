#!/bin/bash

helm uninstall geth-bootnode
helm uninstall geth-node
helm uninstall beacon-node

helm install geth-bootnode ./geth -f ./geth/bootnode-values.yaml

sleep 5

helm install geth-node ./geth -f ./geth/values.yaml 

sleep 10

#helm install beacon-node ./prysm -f ./prysm/beacon-values.yaml
