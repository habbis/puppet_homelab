# Class for basic packages we want on all servers
class puppet_homelab::server_lite::packages {

  if ! defined(Package['sudo']) {
    package { "sudo":
      ensure => "latest",
    }
  }

# REQ0017117: OpenSSL har nok en gang en bug
  if ! defined(Package['openssl']) {
    package { "openssl":
      ensure => "latest",
    }
  }

  package {
    'file':      ensure => installed;
    'wget':      ensure => installed;
    'less':      ensure => installed;
    'curl':      ensure => installed;
    'rsync':     ensure => installed;
    'git':     ensure => installed;
    # RedHat 8 bruker ikke screen men tmux
    #'screen':    ensure => installed;
    'strace':    ensure => installed;
    'ethtool':    ensure => installed;
    'bpftrace':    ensure => installed;
    'tcpdump':   ensure => installed;
    'bc':      	 ensure => installed;
    'python3':   ensure => installed;
  }

  
  case $::osfamily {
    'Debian': { include puppet_homelab::server_lite::packages::debian }
    'RedHat': { include puppet_homelab::server_lite::packages::redhat }
  }
}
