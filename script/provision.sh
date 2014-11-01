#!/bin/sh

# Install MongoDB
if [ ! -e /etc/yum.repos.d/10gen.repo ] ; then
  cp /vagrant/file/10gen.repo /etc/yum.repos.d/
  yum install -y mongo-10gen mongo-10gen-server
  systemctl start mongod
  systemctl enable mongod
fi

# Install nvm.
curl https://raw.githubusercontent.com/creationix/nvm/v0.15.0/install.sh | bash
source /root/.bash_profile

# Install node.js
nvm install 0.10
nvm alias default 0.10

# Install the dependent libraries
npm install -g bower
npm install -g grunt-cli

if [ ! -e /opt/crowi ] ; then
  # Clone Crowi
  cd /opt
  git clone https://github.com/crowi/crowi.git

  # Install Crowi
  cd crowi
  npm install
  bower install --allow-root --config.interactive=false
  grunt
  cp /vagrant/file/default.js /opt/crowi/config/

  # Launch the Crowi
  systemctl stop firewalld
  systemctl disable firewalld
  npm install -g --unsafe-perm pm2
  pm2 start app.js
fi
