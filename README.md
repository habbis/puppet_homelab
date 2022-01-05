# Homelab puppet classes 

Here is puppet classes i use to maintain servers.


### Deployment 

I am adding my custom puppet classess.

to this path path.

```
/etc/puppetlabs/code/modules
```

### Puppet classes

[manifest](https://github.com/habbis/puppet_homelab/tree/master/manifests) here is the 
puppet classes. 


Setup proxmox 7 .

[pve](https://github.com/habbis/puppet_homelab/tree/master/manifests/pve)

Setup container user for docker and lxd and manage sshkeys for that user.

[container_user](https://github.com/habbis/puppet_homelab/blob/master/manifests/container_user.pp)


Setup git container user for deploy git repos and manage sshkeys for that user.

[git_user](https://github.com/habbis/puppet_homelab/blob/master/manifests/git_user.pp)

Setup nfs client on debian and rhel .

[nfs_client](https://github.com/habbis/puppet_homelab/blob/master/manifests/nfs_client.pp)

WIP patch poly on linux distros.

[patch_policy](https://github.com/habbis/puppet_homelab/blob/master/manifests/patch_policy.pp)

Remove user from linux .

[remove_user](https://github.com/habbis/puppet_homelab/blob/master/manifests/remove_user.pp)



[server_lite](https://github.com/habbis/puppet_homelab/tree/master/manifests/server_lite) is a collection 
of puppet classes to setup a server with my basic setup


list of server_lite puppet classes.

Setup proxy for apt.

[apt_proxy](https://github.com/habbis/puppet_homelab/tree/master/manifests/server_lite/apt_proxy)
[apt_proxy.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/apt_proxy.pp)

Deploy cronjob.

[cron](https://github.com/habbis/puppet_homelab/tree/master/manifests/server_lite/cron)

Install pacakges for rhel and debian based systems.

[packages](https://github.com/habbis/puppet_homelab/tree/master/manifests/server_lite/packages)
[packages.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/packages.pp)


Setup sshd_config .


[sshd](https://github.com/habbis/puppet_homelab/tree/master/manifests/server_lite/sshd)
[sshd](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/sshd.pp)

Setup proxy for yum on rhel.

[yum_proxy](https://github.com/habbis/puppet_homelab/tree/master/manifests/server_lite/yum_proxy)
[yum_proxy.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/yum_proxy.pp)

Create and manage standard sudp user.

[ansible_user.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/ansible_user.pp)

Setup /etc/hosts .

[hosts.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/hosts.pp)

Installs locate.

[locate.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/locate.pp)

Setup message of the day.

[motd.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/motd.pp)

Manage ssh keys for root user and ansible .

[sshkeys.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/sshkeys.pp)

[sudo_group.pp](https://github.com/habbis/puppet_homelab/blob/master/manifests/server_lite/sudo_group.pp)


## Facts 

Puppet have facts that can gather info about the servers using puppet class puppet_homelab
you can put them in facts.d .



## Directorys files and templates


files: 
  - Config files that have no variables should be added to files directory.

templates: 
  - Template files that have special variables should be used here ending .erb
    its the same as ansible jinja templeting files ending in .j2 .
    
    



 
