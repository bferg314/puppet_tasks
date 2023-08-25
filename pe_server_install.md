# Install the server from here:
https://www.puppet.com/downloads/puppet-enterprise

# Notes
RUN AS ROOT  
Need at least 4gb of memory for install steps  
Be sure to add the hostname to the /etc/hosts file before running the installation

# Installing on Alma Linux/Rocky Linux Server v8:  
```bash
curl -JLO 'https://pm.puppet.com/cgi-bin/download.cgi?dist=el&rel=8&arch=x86_64&ver=latest'
tar -xf puppet-enterprise-2023.2.0-el-8-x86_64.tar.gz
cd puppet-enterprise-2023.2.0-el-8-x86_64/
./puppet-enterprise-installer
```

# Post Install
Set the password and run the agent as directed  
Add firewalld service  
```bash
firewall-cmd --list-all
firewall-cmd --zone=public --add-service=puppetmaster
firewall-cmd --zone=public --add-service=https
firewall-cmd --runtime-to-permanent![image](https://github.com/bferg314/puppet_tasks/assets/2274645/a43ba352-2963-4676-b339-7d329c54e6d5)
```
