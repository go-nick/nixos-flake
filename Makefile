.PHONY: beelink-master-build beelink-master-switch old-white-worker-build old-white-worker-switch help

help:
	@echo "make beelink-master-build   - dry build, no changes applied"
	@echo "make beelink-master-switch  - build and apply"
	@echo "make old-white-worker-build   - dry build, no changes applied"
	@echo "make old-white-worker-switch  - build and apply"

beelink-master-build:
	sudo nixos-rebuild build --flake /home/nick/DEV/Nicklab/nixos/flake#beelink-master --impure

beelink-master-switch:
	sudo nixos-rebuild switch --flake /home/nick/DEV/Nicklab/nixos/flake#beelink-master --impure

old-white-worker-build:
	sudo nixos-rebuild build --flake /home/nick/DEV/Nicklab/nixos/flake#old-white-worker --impure

old-white-worker-switch:
	sudo nixos-rebuild switch --flake /home/nick/DEV/Nicklab/nixos/flake#old-white-worker --impure
