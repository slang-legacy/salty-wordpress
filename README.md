salty-wordpress
=================

Salt State configuration files for managing WordPress development and production servers.

Before using this, you should configure it by editing `top.sls` ... most of the config is in there.

You can add all your ssh keys to `ssh/keys`, and then reference them in `ssh/init.sls`. By default, my key is the only one there. You should remove that and put your key there instead.

The default username is `slang`, and the password is `core2062` (changing the username is kinda hard, but the password can be changed in `users/init.sls`). However, you need to use ssh keys to actually access it because it's configured to deny password based authentication.

setup script:
```bash
echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list
wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
sudo apt-get update
sudo apt-get install salt-minion
sudo mkdir /srv/salt
cd /srv/salt
git clone git@github.com:slang800/salty-wordpress.git
sudo salt-call --local state.highstate -l debug
```

then just wait for it to run... it takes awhile
