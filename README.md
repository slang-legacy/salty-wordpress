salty-wordpress
=================

Salt State configuration files for managing WordPress development and production servers.

Before using this, you should configure it by editing `top.sls` ... most of the config is in there.

You can add all your ssh keys to `ssh/keys`, and then reference them in `ssh/init.sls`. By default, my key is the only one there. You should remove that and put your key there instead.

The default username is `slang`, and the password is `core2062` (changing the username is kinda hard, but the password can be changed in `users/init.sls`). However, you need to use ssh keys to actually access it because it's configured to deny password based authentication.

Oh, and this installs phpmyadmin too.

setup script:
```bash
sudo apt-get install git
git clone https://github.com/slang800/salty-wordpress.git /srv
sudo sh /srv/setup.sh
sudo salt-call --local state.highstate
```

then just wait for it to run... it takes awhile
