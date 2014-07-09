# configuration files for nginx
/etc/nginx/*:
  file.recurse:
    - name: /etc/nginx
    - source: salt://nginx/config
    - user: root
    - group: root
    - file_mode: 644
    - template: jinja

/var/cache/nginx:
  file.directory:
    - makedirs: True

/var/www:
  file.directory:
    - makedirs: True

# make sure nginx is installed and up
nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/*
