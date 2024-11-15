.PHONY: update
update:
	nix-shell '<home-manager>' -A install
	home-manager switch --flake .#joshu --impure

.PHONY: clean
clean:
	nix-collect-garbage -d
