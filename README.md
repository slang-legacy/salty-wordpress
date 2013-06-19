salt-stack-config
=================

Salt State configuration files for managing WordPress development and production servers.

setup script:
```bash
echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list
wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
sudo apt-get update
sudo apt-get install salt-minion
sudo mkdir /srv/salt
```

put the config repo in `/srv/salt/`

```bash
sudo salt-call --local state.highstate -l debug
```

then just wait for it to run... it takes awhile
