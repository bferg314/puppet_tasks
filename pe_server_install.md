# Install the server from here:
https://www.puppet.com/downloads/puppet-enterprise

# REQUISITES 
Need at least 4gb of memory for install steps  
Be sure to add the hostname to the /etc/hosts file before running the installation  
hostname NEEDS to be a fqdn (server.domain.net)  

# Installing on Alma Linux/Rocky Linux Server v8: 
Alma/Rocky/RHEL should be of the "Server" type  
Running as root   
```bash
curl -JLO 'https://pm.puppet.com/cgi-bin/download.cgi?dist=el&rel=8&arch=x86_64&ver=latest'
tar -xf puppet-enterprise-2023.4.0-el-8-x86_64.tar.gz
cd puppet-enterprise-2023.4.0-el-8-x86_64/
./puppet-enterprise-installer

# avoid firewall issues with rhel derivatives
sudo systemctl disable firewalld
sudo systemctl stop firewalld

# Post install
puppet infrastructure console_password
puppet agent -t
```
# Installing on Ubuntu 22.04 Linux Server: 
```bash
curl -JLO 'https://pm.puppet.com/cgi-bin/download.cgi?dist=ubuntu&rel=22.04&arch=amd64&ver=latest'
tar -xf puppet-enterprise-2023.5.0-ubuntu-22.04-amd64.tar.gz
cd puppet-enterprise-2023.5.0-ubuntu-22.04-amd64/
sudo ./puppet-enterprise-installer

# Post install
sudo su # wants you to run as root for puppet infrastructure command
puppet infrastructure console_password
puppet agent -t # twice!
```


# Post Install 
Add firewalld service so traffic can get through
```bash
firewall-cmd --list-all
firewall-cmd --zone=public --add-service=puppetmaster
firewall-cmd --zone=public --add-service=https
firewall-cmd --runtime-to-permanent
```


