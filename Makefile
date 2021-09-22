.POSIX:
init:
	@echo Initiation finished.
install:
	@$$SHELL ./.local/bin/install_magpie
	@echo Installation finished.
dev:
	@$$SHELL ./.local/bin/install_dev
	@echo Installation finished.
.PHONY: install
