class puppet_homelab::server_lite::locate {

  package {
    "mlocate": ensure => installed;
  }

}
