# Class for installing gitea on linux
class puppet_homelab::gitea (
  # having probles with variables
  $gitea_version = '1.16.2',) {

    validate_string($gitea_version)


  
  file { '/usr/local/bin/gitea':
    ensure => present,
    #owner  => 'git',
    #group  => 'git',
    #mode   => '0750',
    source  => 'http://mirror.habbfarm.net/repository/binary_and_tar_files/gitea/gitea-1.16.2-linux-amd64'

  }
  


  exec {
    'gitea_chmod_executable':
     path        => ['/bin','/usr/bin', '/usr/sbin'],
     command     => 'chmod +x /usr/local/bin/gitea',
   }

  user { 'git':
    ensure      => present,
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'git',
  }

  group { 'git':
    ensure  => present,
  }


  file { '/var/lib/gitea':
    ensure => directory,
    owner  => 'git',
    group  => 'git',
    mode   => '0750',

  }

  file { '/var/lib/gitea/custom':
    ensure => directory,
    owner  => 'git',
    group  => 'git',
    mode   => '0750',

  }


  file { '/var/lib/gitea/data':
    ensure => directory,
    owner  => 'git',
    group  => 'git',
    mode   => '0750',

  }


  file { '/var/lib/gitea/log':
    ensure => directory,
    owner  => 'git',
    group  => 'git',
    mode   => '0750',

  }


  file { '/etc/gitea':
    ensure => directory,
    owner  => 'root',
    group  => 'git',
    mode   => '0770',

  }


  file { '/etc/systemd/system/gitea.service':
     owner  => 'root',
     group  => 'root',
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/gitlab/gitea.service'
  }


  exec {
    'gitea_enable_start':
     path        => ['/bin','/usr/bin', '/usr/sbin'],
     command     => 'systemctl enable --now gitea',
     unless      => ['test -e /etc/systemd/system/gitea.service'],
     #refreshonly => true;
  }


}
