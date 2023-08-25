# Puppet Config
## Generic Prep
```bash
# Lock in hostname
hostnamectl set-hostname {newnamehere} –static

# Add puppetmaster
sudo vim /etc/hosts

# Update IP if needed
nmtui
```

## Agents
## Config File
```ini
[main]
certname = {clientname}
server = {puppetmastername}
```


## RPM
### Install
```bash
# Lock in hostname
hostnamectl set-hostname {newnamehere} –static

# Add puppetmaster
sudo vim /etc/hosts

sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
sudo yum install puppet-agent

vim ~/.bashrc
export PATH=$PATH:/opt/puppetlabs/bin

sudo vim /etc/puppetlabs/puppet/puppet.conf

sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
```

## Deb
```bash
sudo vim /etc/hosts

wget https://apt.puppet.com/puppet7-release-jammy.deb
sudo dpkg -i puppet7-release-jammy.deb

sudo apt install puppet-agent
sudo vim /etc/puppetlabs/puppet/puppet.conf

vim ~/.bashrc
export PATH=$PATH:/opt/puppetlabs/bin

sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

```
