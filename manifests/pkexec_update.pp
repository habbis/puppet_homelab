# Class for installing squid on linux server
class puppet_homelab::pkexec_update {





  case $::osfamily {
    'redhat': {
  package { 
    'policykit-1':  ensure => latest;
    }
}
     'debian': {
  package { 
    'policykit-1':  ensure => latest;
    }
  }
 }
}
