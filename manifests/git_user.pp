class puppet_homelab::git_user {

  user { 'gituser':
    ensure      => present,
    home        => '/home/gituser',
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'gituser',
  }

  group { 'gituser':
    ensure  => present,
  }

  if $kernel == "Linux" {
    file { '/home/gituser/.ssh/authorized_keys':
      ensure  => file,
      backup  => false,
      content => template("habbfarm/sshkeys/authorized_keys.erb"),
    }
    file { '/home/gituser/.ssh':
      ensure  => 'directory',
      owner   => 'gituser',
      group   => 'gituser',
      mode    => '0700',
    }
  }
}
