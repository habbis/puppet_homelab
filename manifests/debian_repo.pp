# Class for installing squid on linux server
class puppet_homelab::debian_repo {
  case $::osfamily {
    'debian': {
  file { '/etc/apt/sources.list':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/repo/debian/sources.list'
   }
  }
 }
}
