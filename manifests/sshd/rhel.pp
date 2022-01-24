# Class to install nrpe on debian and ubuntu
class puppet_homelab::sshd::rhel inherits puppet_homelab::sshd {

package {
    'openssh-server':       ensure => installed;
  }

  service {
    'ssh':
      require     => Package['openssh-server'],
      ensure      => running,
      enable      => true,
      hasstatus   => true,
      hasrestart  => true;
  }

  file { '/etc/ssh/sshd_config':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/sshd/rhel/sshd_config'
  }


  exec {
    'ssh_restart':
      command     => '/etc/init.d/ssh restart',
      refreshonly => true;
  }
}

