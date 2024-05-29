.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Initialize by installing dependencies
	@docker compose run --rm sidecar

bash: ## Open bash in new testing container
	@docker compose run --rm composer bash

fix: ## Run php-cs-fixer on all files
	@docker compose run --rm composer vendor/bin/php-cs-fixer fix

phpstan: ## Run phpstan level 9 on all files
	@docker compose run --rm composer vendor/bin/phpstan analyse src tests -l 9

test: ## Run all tests and generate coverage
	@docker compose run --rm composer vendor/bin/phpunit tests --testdox --coverage-html ./coverage
