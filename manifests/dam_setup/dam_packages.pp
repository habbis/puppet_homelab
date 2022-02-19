# Class for my dan server
class puppet_homelab::dam_setup::dam_packages {


  case $::osfamily {
    'Debian': {

    file { '/etc/apt/trusted.gpg.d/terraform_gpg':
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/puppet_homelab/apt_gpg/terraform_gpt'
    }

    apt::source { 'terraform_repo':
    comment  => 'repo for terraform',
    location => 'https://apt.releases.hashicorp.com',
    release  => 'bullseye',
    repos    => 'terraform',
    }

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
    }

  }

    'RedHat': {

    exec {
    'yum_terraform_repo':
    path        => ['/bin','/usr/bin', '/usr/sbin'],
    command     => 'yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo',

  }
}
}


  case $::osfamily {
    'Debian': {

    file { '/etc/apt/trusted.gpg.d/packer_gpg':
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/puppet_homelab/apt_gpg/packer_gpt'
    }

    apt::source { 'terraform_repo':
    comment  => 'repo for packer',
    location => 'https://apt.releases.hashicorp.com',
    release  => 'bullseye',
    repos    => 'packer',
    }

  }
    'Ubuntu': {

    file { '/etc/apt/trusted.gpg.d/packer_gpg':
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/puppet_homelab/apt_gpg/packer_gpt'
    }

    apt::source { 'packer_repo':
    comment  => 'repo for packer',
    location => 'https://apt.releases.hashicorp.com',
    release  => 'focal',
    repos    => 'packer',
    }

  }

    'RedHat': {

    exec {
    'yum_terraform_repo':
    path        => ['/bin','/usr/bin', '/usr/sbin'],
    command     => 'yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo',

  }
}
}


  package {
    'terraform':      ensure => installed;
    'packer':      ensure => installed;
  }


  package {
    'ansible':      ensure => installed;
    provider  ==>  'pip3',
  }

}
