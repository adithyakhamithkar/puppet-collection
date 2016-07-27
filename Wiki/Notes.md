#Print puppet agent environment
puppet agent --configprint environment

#Adding an environment
Edit this file /etc/puppetlabs/puppet/puppet.conf on master and agent
[main]
environment=test-env

#List the certs to be added
sudo /opt/puppetlabs/bin/puppet cert list

#List all the certs
sudo /opt/puppetlabs/bin/puppet cert list --all

#Sign a request
sudo /opt/puppetlabs/bin/puppet cert sign <hostname>

#Sign all request
sudo /opt/puppetlabs/bin/puppet cert sign --all

#Edit code directory in
vim /etc/puppetlabs/puppet/puppet.conf
vim /etc/puppetlabs/puppetserver/conf.d/puppetserver.conf
