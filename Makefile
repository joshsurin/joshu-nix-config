.PHONY: update
update:
	home-manager switch --flake .#joshu

.PHONY: clean
clean:
	nix-collect-garbage -d
