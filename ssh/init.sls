openssh-server:
  pkg:
    - installed

ssh:
  service.running:
    - require:
      - pkg: openssh-server
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/sshd_config
    - mode: 644
    - user: root
    - group: root

# add ssh keys
slang_ssh:
  ssh_auth:
    - present
    - user: slang
    - enc: ssh-rsa
    - source: salt://ssh/keys/slang.id_rsa.pub
    - require:
      - user: slang
