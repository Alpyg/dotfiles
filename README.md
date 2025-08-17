# Dotfiles

Use pacman hooks to automatically install dotfiles on package install and remove them on uninstall

###### Installation

```sh
git clone https://github.com/Alpyg/dotfiles ~/.dotfiles
cd ~/.dotfiles
./bin/install-hooks.sh
```

> Don't forget to rerun `bin/install-hooks.sh` if you move the repository somewhere.


This will install the hooks that will call `bin/hook.sh` on package install/uninstall.

Copy the package template at `pkgs/.template` into `pkgs/<pkg_name>` and modify it to your needs.
