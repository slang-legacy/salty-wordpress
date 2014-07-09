misc-pkgs:
  pkg.installed:
    - pkgs:
      - git
      - screen

unneeded-packages:
  pkg.purged:
    - names:
      - landscape-common
      - vim
      - vim-tiny
