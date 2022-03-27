# Class for installing squid on linux server
class puppet_homelab::ntp_client {


  package { 
    'chrony':  ensure => installed;
    }



  case $::osfamily {
    'redhat': {
  file { '/etc/chrony.conf':
     owner  => root,
     group  => root,
     mode   => '0644',
     ensure => present,
     source => 'puppet:///modules/puppet_homelab/chrony/redhat/client/chrony.conf'
  }
}
     'debian': {
  file { '/etc/chrony/chrony.conf':
     owner  => root,
     group  => root,
     mode   => '0644',
     ensure => present,
     source => 'puppet:///modules/puppet_homelab/chrony/debian/client/chrony.conf'
  }
 }
}

case $::osfamily {
    'redhat': {
  service {
    'chronyd':
      require     => Package['chrony'],
      ensure      => running,
      enable      => true,
      hasstatus   => true,
      hasrestart  => true;
    }
  }
    'debian': {
  service {
    'chrony':
      require     => Package['chrony'],
      ensure      => running,
      enable      => true,
      hasstatus   => true,
      hasrestart  => true;
    }
  }
}

}
