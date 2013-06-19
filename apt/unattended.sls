# This enables unattended-upgrades on minions
unattended:
  pkg.installed:
    - name: unattended-upgrades
    - require:
      - file: /etc/apt/apt.conf.d/10periodic
      - file: /etc/apt/apt.conf.d/50unattended-upgrades

/etc/apt/apt.conf.d/10periodic:
  file.managed:
    - source: salt://apt/conf/10periodic

/etc/apt/apt.conf.d/50unattended-upgrades:
  file.managed:
    - source: salt://apt/conf/50unattended-upgrades