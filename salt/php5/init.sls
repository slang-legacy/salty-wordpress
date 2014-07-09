mysql-pkgs:
  pkg.installed:
    - pkgs:
      - mysql-server
      - mysql-client

php5-mysql:
  pkg.installed:
    - require:
      - pkg: mysql-pkgs

php5-fpm:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: php5-mysql
      - pkg: php5-fpm
      - file: /etc/php5/fpm/php.ini

php5:
  pkg.installed:
    - require:
      - pkg: nginx
      - pkg: php5-fpm

/etc/php5/fpm/php.ini:
  file.managed:
    - source: salt://php5/php.ini
