.PHONY: update
update:
	home-manager switch --flake .#joshu --impure

.PHONY: clean
clean:
	nix-collect-garbage -d
