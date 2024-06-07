.DEFAULT_GOAL := help

USE_DOCKER ?= true

ifeq ($(USE_DOCKER), true)
    PHP = docker compose run --rm composer php
    COMPOSER = docker compose run --rm composer composer
else
    PHP = php
    COMPOSER = composer
endif

.PHONY: help
help: ## Show this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


###
## DOCKER
###
.PHONY: build
build: ## Build the docker container
	@docker compose build

.PHONY: bash
bash: ## Open bash in new testing container
	@$(PHP) bash

###
## PHP
###
.PHONY: init
init: ## Initialize by installing dependencies
ifeq ($(USE_DOCKER), true)
	@docker compose run --rm sidecar
else
	@$(COMPOSER) install
endif

###
## QA
###
.PHONY: normalize-composer
normalize-composer: ## Normalizes the composer.json file
	@$(COMPOSER) normalize

.PHONY: dry-normalize-composer
dry-normalize-composer: ## Normalizes the composer.json file
	@$(COMPOSER) normalize --dry-run

.PHONY: fix
fix: ## Run php-cs-fixer on all files
	@$(PHP) vendor/bin/php-cs-fixer fix

.PHONY: dry-fix
dry-fix: ## Run php-cs-fixer on all files but only show changes, don't go through with them
	@$(PHP) vendor/bin/php-cs-fixer check --diff

.PHONY: phpstan
phpstan: ## Run phpstan level 9 on all files
	@$(PHP) vendor/bin/phpstan analyse src tests -l 9

.PHONY: test
test: ## Run all tests and generate coverage
	@$(PHP) vendor/bin/phpunit tests --testdox --coverage-html ./coverage
