class puppet_homelab::container_user {

  user { 'cusr':
    ensure      => present,
    home        => '/home/cusr',
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'cusr',
  }

  group { 'cusr':
    ensure  => present,
  }

  if $kernel == "Linux" {
    file { '/home/cusr/.ssh/authorized_keys':
      ensure  => file,
      backup  => false,
      owner  =>  cusr,
      group  =>  cusr,
      content => template("puppet_homelab/sshkeys/authorized_keys.erb"),
    }
    file { '/home/cusr/.ssh':
      ensure  => directory,
      owner  =>  cusr,
      group  =>  cusr,
      mode    => '0700';
    }
  }

}
