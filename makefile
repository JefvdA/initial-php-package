.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build the docker container
	@docker compose build

.PHONY: normalize-composer
normalize-composer: ## Normalizes the composer.json file
	@docker compose run --rm composer composer normalize

.PHONY: dry-normalize-composer
dry-normalize-composer: ## Normalizes the composer.json file
	@docker compose run --rm composer composer normalize --dry-run

.PHONY: init
init: ## Initialize by installing dependencies
	@docker compose run --rm sidecar

.PHONY: bash
bash: ## Open bash in new testing container
	@docker compose run --rm composer bash

.PHONY: fix
fix: ## Run php-cs-fixer on all files
	@docker compose run --rm composer vendor/bin/php-cs-fixer fix

.PHONY: dry-fix
dry-fix: ## Run php-cs-fixer on all files but only show changes, don't go through with them
	@docker compose run --rm composer vendor/bin/php-cs-fixer check --diff

.PHONY: phpstan
phpstan: ## Run phpstan level 9 on all files
	@docker compose run --rm composer vendor/bin/phpstan analyse src tests -l 9

.PHONY: test
test: ## Run all tests and generate coverage
	@docker compose run --rm composer vendor/bin/phpunit tests --testdox --coverage-html ./coverage
