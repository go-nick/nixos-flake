.PHONY: beelink-master-build beelink-master-switch help

help:
	@echo "make beelink-master-build   - dry build, no changes applied"
	@echo "make beelink-master-switch  - build and apply"

beelink-master-build:
	sudo nixos-rebuild build --flake /home/nick/DEV/Nicklab/nixos/flake#beelink-master --impure

beelink-master-switch:
	sudo nixos-rebuild switch --flake /home/nick/DEV/Nicklab/nixos/flake#beelink-master --impure
