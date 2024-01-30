# Puppet Config
## Generic Prep
```bash
# Lock in hostname with FQDN
hostnamectl set-hostname awesomeclient.mydomain.loc

# Add puppetmaster
sudo vim /etc/hosts

# Update IP if needed
nmtui
```

## Agents
## Config File
```ini
[main]
certname = awesomeclient.mydomain.loc
server = greatmaster.mydomain.loc
```

## Puppet Master
Make sure you have updated your master server hosts file if needed so it knows how to get to the agent...  

## RPM
### Install
```bash
# Lock in hostname
hostnamectl set-hostname awesomeclient.mydomain.loc

# Add puppetmaster
sudo vim /etc/hosts

sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
sudo dnf install puppet-agent -y

vim ~/.bashrc
export PATH=$PATH:/opt/puppetlabs/bin

# update config
sudo vim /etc/puppetlabs/puppet/puppet.conf

# [main]
# certname = {clientname}
# server = {puppetmastername}

# if the firewall is running... open the port for communication
sudo firewall-cmd --zone=public --add-port=8140/tcp --permanent
sudo firewall-cmd --reload

# start the service
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

# validate connection as root
su -
puppet agent -t
```

## Deb
```bash
sudo vim /etc/hosts

# 22.04
wget https://apt.puppet.com/puppet8-release-jammy.deb
sudo dpkg -i puppet8-release-jammy.deb

# 20.04
wget https://apt.puppet.com/puppet8-release-focal.deb
sudo dpkg -i puppet8-release-focal.deb

sudo apt install puppet-agent
sudo vim /etc/puppetlabs/puppet/puppet.conf

vim ~/.bashrc
export PATH=$PATH:/opt/puppetlabs/bin

sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

```
