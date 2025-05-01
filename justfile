alias i := install
alias u := uninstall

install:
  stow -v --target=$HOME/.config .config

uninstall:
  stow -v -D --target=$HOME/.config .config
