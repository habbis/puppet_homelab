# Class for specific redhat packages
class puppet_homelab::server_lite::packages::redhat {
  if $operatingsystemrelease !~ /^5.*/ {
    package {
      'xz':                ensure => installed;
      'vim-enhanced':                ensure => installed;
      'coreutils':         ensure => installed;
      'bind-utils':        ensure => installed;
      'sysstat':           ensure => installed;
      'virt-what':         ensure => installed;
      'net-tools': ensure => installed;
      'tldr': ensure => installed;
      'yum-utils': ensure => installed;

    }
  }
   # CVE-2021-4034
  # if ! defined(Package['polkit']) {
  #  package { "polkit":
  #    ensure => "absent",
  #  }
  #}

  

  if $operatingsystemrelease =~ /^7.*/ {
    package {
      'nmap-ncat':       ensure => installed;
    }
  } else {
    package {
      'nc':              ensure => installed;
    }
  }
}
