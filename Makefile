.DEFAULT_GOAL := help
PROJ_DIR := $(shell pwd)
SHELL = /bin/bash
MEGA_LINTER_IMAGE ?= megalinter/megalinter-documentation:v5

# adjust this if the api is incremented

##@ General

help: ## List the make targets supported
	@echo "Here are the make targets for $(shell basename ${PROJ_DIR})."
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Install - targets to install supporting software

# TODO working on getting cross install going 
install: install-docker install-pandoc ## install all dependencies

install-docker:
	@./tools/is-installed.sh docker

install-pandoc:  ## install instructions for pandoc to create different formats of the .md file
	@./tools/install/is-installed.sh pandoc "install using https://pandoc.org/installing.html instruction for your runtime environment."

##@ Build - targets to build different parts the repo

build-pdf-resume: ## Converts md into HTML docs
	pandoc -V geometry:margin=.5in -s -o ./.out/resume.pdf ./about/experience.md ./about/technical-skills.md ./about/education.md

##@ Test - Quality Assurance targets to format, lint and test this repository

qa: qa-lint  ## Run all QA targets on repository

qa-lint:  ## run Mega-linter using .mega-liner.yml config files
	@docker run --rm -v ${PROJ_DIR}:/tmp/lint ${MEGA_LINTER_IMAGE}

lint-fix:  ## run Mega-linter in fix mode
	@docker run --rm -e APPLY_FIXES=all -v ${PROJ_DIR}:/tmp/lint ${MEGA_LINTER_IMAGE}

lint-regex:  ## run Mega-linter against regex. make lint-arg REGEX={file or directory}
	@docker run --rm -e FILTER_REGEX_INCLUDE=$(REGEX) -v ${PROJ_DIR}:/tmp/lint ${MEGA_LINTER_IMAGE}

lint-interactive:  ## run Mega-linter container in interactive mode
	@docker run --rm -ti --entrypoint=/bin/bash -v ${PROJ_DIR}:/tmp/lint ${MEGA_LINTER_IMAGE}

.PHONY: build-pdf-resume help install install-docker install-pandoc lint-fix lint-regex lint-run qa qa-lint
