class puppet_homelab::server_lite::sshkeys (
  $puppet_homelab_sshkeys_ssh_authorized_keys = puppet_homelab_sshkeys_ssh_authorized_keys) {
  if $kernel == "Linux" {
    file { '/root/.ssh/authorized_keys':
      ensure  => file,
      backup  => false,
      content => template("puppet_homelab/sshkeys/authorized_keys.erb"),
    }
    file { '/root/.ssh': 
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0700';
    }
  }

  if $kernel == "Linux" {
    file { '/home/ansible/.ssh/authorized_keys':
      ensure  => file,
      backup  => false,
      content => template("puppet_homelab/sshkeys/authorized_keys.erb"),
    }
    file { '/home/ansible/.ssh': 
      ensure  => directory,
      owner   => 'ansible',
      group   => 'ansible',
      mode    => '0700';
    }
  }
}
