{% from 'top.sls' import default_domain_name, domain_names %}

# Configuration files for nginx
/etc/nginx/*:
  file.recurse:
    - name: /etc/nginx 
    - source: salt://nginx/config
    - user: root
    - group: root
    - file_mode: 644
    - template: jinja
    - context:
      default_domain_name: {{ default_domain_name }}
      domain_names: '{{ domain_names }}'

/var/cache/nginx:
  file.directory:
    - makedirs: True

/var/www:
  file.directory:
    - makedirs: True

# Make sure nginx is installed and up
nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/*
