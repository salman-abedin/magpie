.POSIX:
init:
	@echo Initiation finished.
install:
	@$$SHELL ./.local/bin/install
	@echo Installation finished.
.PHONY: init install
