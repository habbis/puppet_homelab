# Class for installing squid on linux server
class puppet_homelab::ubuntu_repo {
  case $::osfamily {
    'ubuntu': {
  file { '/etc/apt/sources.list':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/repo/ubuntu/sources.list'
   }
  }
 }
}
