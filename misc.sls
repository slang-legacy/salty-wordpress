misc-pkgs:
  pkg.installed:
    - pkgs:
      - git
      - screen

# if nginx isn't installed first, apache2 will be installed
phpmyadmin:
  pkg.installed:
    - require:
      - pkg: nginx

unneeded-packages:
  pkg.purged:
    - names:
      - landscape-common
      - vim
      - vim-tiny
