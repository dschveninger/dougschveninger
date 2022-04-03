.DEFAULT_GOAL := help
PROJ_DIR := $(shell pwd)
SHELL = /bin/bash

# adjust this if the api is incremented

##@ General

help: ## List the make targets supported
	@echo "Here are the make targets for $(shell basename ${PROJ_DIR})."
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Install - targets to install supporting software

# TODO working on getting cross install going 
install: install-docker install-pandoc ## install all dependances

install-docker:
	@./tools/is-installed.sh docker

install-pandoc:  ## install instructuions for pandoc to create different formats of the .md file
	@./tools/is-installed.sh pandoc "install using https://pandoc.org/installing.html instruction for your runtime environment."

##@ Build - targets to build different parts the repo

build-pdf-resume: ## Converts md into HTML docs
	pandoc -V geometry:margin=.5in -s -o ./.out/resume.pdf ./about/experience.md ./about/technical-skills.md ./about/education.md

##@ Test - Quality Assurance targets to format, lint and test this repository

qa: qa-lint ## Run all qa targets for the repo

qa-lint:  ## lint all code type in the repo
	@docker run --rm --env-file .github/linters/.super-linter-local.env -v /Users/doug/github/dougschveninger:/tmp/lint github/super-linter

lint-all:  ## run all linter against all files
	@docker run --rm -e RUN_LOCAL=true -v /Users/doug/github/dougschveninger:/tmp/lint github/super-linter

lint-regex:  ## run linter against all files. make lint-regex REGEX={file or directory regex}
	docker run --rm -e RUN_LOCAL=true -e FILTER_REGEX_INCLUDE=$(REGEX) -v /Users/doug/github/dougschveninger:/tmp/lint github/super-linter

lint-run:  ## run all linter against all files
	@docker run --rm -it -e RUN_LOCAL=true -v /Users/doug/github/dougschveninger:/tmp/lint --entrypoint=/bin/bash github/super-linter 

.PHONY: build-pdf-resume help install install-docker install-pandoc lint-all lint-arg lint-run qa qa-lint
