#!/bin/bash
#Start
echo "Installing puppetserver"

#Download the apt-get repo details
cd ~ && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb

#Install the repo
sudo dpkg -i puppetlabs-release-pc1-trusty.deb

#Update cache
sudo apt-get update

#Install puppetserver
sudo apt-get -y install puppetserver

#Allociate memory
sudo sed -i -e 's/.*JAVA_ARGS=.*/JAVA_ARGS="-Xms1g -Xmx1g -XX:MaxPermSize=256m"/g' /etc/default/puppetserver

#Make puppetserver startup after reboot
sudo /opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true

sudo /opt/puppetlabs/bin/puppet module install puppetlabs-apt

#Autosign all hosts
echo '*' > /etc/puppet/autosign.conf

#Fix puppet alias
cd /etc/profile.d && sh puppet-agent.sh

#Restart puppetserver
sudo /etc/init.d/puppetserver restart

echo "Done"
#End
