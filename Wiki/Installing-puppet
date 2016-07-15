#Download the apt-get repo details
cd ~ && wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb

#Install the repo
sudo dpkg -i puppetlabs-release-pc1-trusty.deb

#Update cache
sudo apt-get update

#Install puppetserver
sudo apt-get -y install puppetserver

#Allociate memory
Open /etc/default/puppetserver
Edit
JAVA_ARGS="-Xms3g -Xmx3g"

#Make puppetserver startup after reboot
sudo /opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true

#Install puppet-agent
sudo apt-get install puppet-agent

#Make puppet-agent startup after reboot
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
