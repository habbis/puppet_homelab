#Class for Debian specific packages
class puppet_homelab::server_lite::packages::debian {

  package {
    'chase':     ensure => installed;
    'iotop':     ensure => installed;
    'pwgen':     ensure => installed;
    'xz-utils':  ensure => installed;
    'cron-apt':  ensure => installed;
    'dnsutils':  ensure => installed;
    'sysstat':   ensure => installed;
    'virt-what': ensure => installed;
    'net-tools': ensure => installed;
    'tldr': ensure => installed;
  }
  if ! defined(Package['vim']) {
    package {
      'vim':       ensure => installed;
    }
  }

 # CVE-2021-4034
  # if ! defined(Package['policykit-1']) {
  #  package { "policykit-1":
  #    ensure => "absent",
  #  }
  #}


}
