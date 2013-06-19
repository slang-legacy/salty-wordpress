{% from 'top.sls' import auth_salts, mysql_password %}

python-mysqldb:
  pkg:
    - installed
    - require:
      - pkg: mysql-pkgs

wordpress:
  mysql_database.present:
    - require:
      - pkg: python-mysqldb
  mysql_user.present:
    - name: wordpress
    - host: localhost
    - password: {{ mysql_password }}
    - require:
      - pkg: python-mysqldb
  mysql_grants.present:
    - grant: all privileges
    - database: '*.*'
    - user: wordpress
    - order: last

/var/www/wordpress:
  cmd:
    - script
    - source: salt://wordpress/setup.sh
    - onlyif: 'test ! -e /var/www/wordpress'

/var/www/wordpress/wp-config.php:
  file.managed:
    - source: salt://wordpress/wp-config.php
    - user: www-data
    - group: www-data
    - template: jinja
    - context:
      mysql_password: {{ mysql_password }}
      auth_salts: {{ auth_salts }}
    - order: last
