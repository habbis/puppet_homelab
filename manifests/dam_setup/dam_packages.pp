# Class for basic packages we want on all servers
class puppet_homelab::dam_setup::dam_packages {

  file { '/etc/apt/trusted.gpg.d/terraform_gpg':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/apt_gpg/terraform_gpt'
  }

  apt::source { 'terraform_repo':
    comment  => 'This repo contains terraform',
    location => 'https://apt.releases.hashicorp.com',
    release  => 'bullseye',
    repos    => 'terraform',
  };

  dam_package {
    'file':      ensure => installed;
    'wget':      ensure => installed;
    'less':      ensure => installed;
    'curl':      ensure => installed;
    'rsync':     ensure => installed;
    # RedHat 8 bruker ikke screen men tmux
    #'screen':    ensure => installed;
    'strace':    ensure => installed;
    'ethtool':    ensure => installed;
    'bpftrace':    ensure => installed;
    'tcpdump':   ensure => installed;
    'bc':      	 ensure => installed;
  }

  
  #case $::osfamily {
  #  'Debian': { include puppet_homelab::server_lite::packages::debian }
  #  'RedHat': { include puppet_homelab::server_lite::packages::redhat }
  #}


  case $::osfamily {
    'Debian': {  

     file { '/etc/apt/trusted.gpg.d/terraform_gpg':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/apt_gpg/terraform_gpt'
     }

    apt::source { 'terraform_repo':
    comment  => 'This repo contains terraform',
    location => 'https://apt.releases.hashicorp.com',
    release  => 'bullseye',
    repos    => 'terraform',
    };

  }
    'Ubuntu': {  

     file { '/etc/apt/trusted.gpg.d/terraform_gpg':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/apt_gpg/terraform_gpt'
     }

    apt::source { 'terraform_repo':
    comment  => 'This repo contains terraform',
    location => 'https://apt.releases.hashicorp.com',
    release  => 'focal',
    repos    => 'terraform',
    };

  }

    'RedHat': {  


  }
 }
}
