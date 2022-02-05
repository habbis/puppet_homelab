# Class for installing gitea on linux
class puppet_homelab::gitea ($gitea_version) {

  #package { 
  #  'wget':  ensure => installed;
  #  'git':  ensure => installed;
  #  }

  exec {
    'gitea_download':
     #path        => ['/bin'],
     command     => '/usr/bin/wget -O gitea http://mirror.habbfarm.net/repository/binary_and_tar_files/gitea/gitea-1.16.0-linux-amd64 ; /usr/bin/mv gitea /usr/local/bin/',
     #command     => '/usr/bin/wget https://dl.gitea.io/gitea/$gitea_version/gitea-$gitea_version-linux-amd64 ; /bin/cp gitea-$gitea_version-linux-amd64 /usr/local/bin/gitea',
     unless      => '/usr/bin/test -e /usr/local/bin/gitea',
   }


  exec {
    'gitea_chmod_executable':
     #path        => ['/bin'],
     command     => '/usr/bin/chmod +x /usr/local/bin/gitea',
     #unless      => '/usr/bin/test -e /usr/local/bin/gitea',
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
     path        => ['/bin'],
     command     => 'systemctl enable --now gitea',
     unless      => ['test -e /etc/systemd/system/gitea.service'],
     #refreshonly => true;
  }

#  exec {
#   'gitea_restart':
#    path        => ['/bin'],
#    command     => 'systemctl start gitea',
#    refreshonly => true;
# }


}
