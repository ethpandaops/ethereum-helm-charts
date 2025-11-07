SHELL=/bin/bash

UID := $(shell id -u)
CURRENT_DIR := $(shell pwd)

.PHONY: init lint docs clean update-ethereum-node-deps all

.DEFAULT_GOAL := all

init:
	@pre-commit install

update-ethereum-node-deps:
	@./scripts/update-ethereum-node-deps.sh

lint: update-ethereum-node-deps
	@docker run --rm --workdir /workdir --volume "$(CURRENT_DIR):/workdir" -u $(UID) -e "HOME=/tmp" quay.io/helmpack/chart-testing:v3.13.0 sh -ac 'chown ${UID} .; exec ct lint --target-branch master'

docs:
	@docker run --rm --volume "$(CURRENT_DIR):/helm-docs" -u $(UID) jnorwood/helm-docs:v1.5.0

all: docs update-ethereum-node-deps lint

clean:
	@pre-commit uninstall
