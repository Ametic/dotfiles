# Ametic's NixOS Dotfiles
My personal dotfiles that i'm using on my daily PC.
Uses some parts from other configurations mentioned in **Credits**.

> [!IMPORTANT]  
> These dotfiles are fitted only for my needs, check every file before using it.

#### Usage
- If you're sure that u want to use it, follow these steps:
- Use these commands:
	- ```nix-shell -p git vim```
	- ```git clone https://github.com/ametic/dotfiles ~/nixos-config```
- Open your text editor, open `/nixos-config` folder, and search for keyword `jakub` which is my hostname, and replace for yours. 
- Generate your hardware configuration using this command:
	- ```nixos-generate-config --show-hardware-config > hosts/desktop/hardware.nix```
- Rebuild configuration using these commands:
	- ``` NIX_CONFIG="experimental-features = nix-command flakes" ```
```sudo nixos-rebuild switch --flake .#desktop```

#### Credits
- [Zaney](https://gitlab.com/Zaney/) - [ZaneyOS](https://gitlab.com/Zaney/zaneyos)
- [anmaro](https://github.com/annmaro) - [hyprnix](https://github.com/annmaro/hyprnix/)
