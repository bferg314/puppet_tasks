# puppet_tasks
Here are some tasks!  

## Easy transfer using WinSCP as non-root
```bash
sudo usermod -aG users $USER
sudo chown -R :users /etc/puppetlabs/code
sudo chmod -R g+rw /etc/puppetlabs/code
cd /etc/puppetlabs/code/environments/production/modules
```

and just rerun this when the permissions get stripped by puppet enterprise  
``` bash
sudo chown -R :users /etc/puppetlabs/code
```