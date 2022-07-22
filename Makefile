.POSIX:
init:
	@echo Initiation finished.
install:
	@$$SHELL ./.local/bin/install_magpie
	@echo Installation finished.
.PHONY: install
