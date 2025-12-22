host?=$(shell hostname)
HOSTS_PATH=./hosts
TARGET=${host}

check-target:
ifeq ("$(host)", "")
	$(error "Host not set")
endif

lint:
	alejandra .

update:
	nix flake update

nixos.build: check-target
	sudo nixos-rebuild build --flake .#${TARGET}

nixos.dry-build: check-target
	sudo nixos-rebuild dry-build --flake .#${TARGET}

nixos.switch: check-target
	sudo nixos-rebuild switch --flake .#${TARGET}

nixos.test: check-target
	sudo nixos-rebuild test --flake .#${TARGET}

nixos.upgrade: check-target update nixos.build
	sudo nixos-rebuild switch --flake .#${TARGET}

coder.init:
	sudo nixos-rebuild switch --flake .#coder
