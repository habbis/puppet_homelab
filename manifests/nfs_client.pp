# Class to install nfs client part on linux servers
class puppet_homelab::nfs_client {
  if $::osfamily == 'RedHat' {
    $nfs_client = 'nfs-utils'
  } else {
    $nfs_client = 'nfs-common'
  }
  package { $nfs_client:
    ensure => installed,
  }
}
