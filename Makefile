.PHONY: hooks
hooks:
	pre-commit install
	pre-commit install --hook-type commit-msg