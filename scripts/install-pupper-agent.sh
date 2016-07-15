#!/bin/bash
#Start
echo "Installing puppet-agent"

#Download the apt-get repo details
cd ~ && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb

#Install the repo
sudo dpkg -i puppetlabs-release-pc1-trusty.deb

#Update cache
sudo apt-get update

#Install puppet-agent
sudo apt-get -y install puppet-agent

#Make puppet-agent startup after reboot
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

#Fix puppet alias
cd /etc/profile.d && sh puppet-agent.sh

#Restart puppet-agent
sudo /etc/init.d/puppet-agent restart

echo "Done"
#End
