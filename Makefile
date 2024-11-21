default: help

.PHONY: docs

SHELL=/bin/bash -eu -o pipefail

EXECUTABLES =
K := $(foreach exec,$(EXECUTABLES), $(if $(shell $(exec) --version || echo $?),some string,$(error "Unable to check $(exec) --version in PATH. Please install.")))

help:
	@echo "Commands"
	@echo "========"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2, $$3, $$4, $$5, $$6, $$7, $$8, $$9, $$10, $$11, $$12, $$13, $$14, $$15, $$16, $$17, $$18, $$19, $$20, $$21, $$22, $$23, $$24}'

setup: ## Setup the environment
	python -m venv .venv
	source .venv/bin/activate
	pip install --upgrade pip
	pip install -r requirements.txt

label: ## Labels confluence pages, edit the file to set up the config
	cd confluence && python tree-marker.py
