# Class for installing squid on linux server
class puppet_homelab::ntp_server {


  package { 
    'chrony':  ensure => installed;
    }



  case $::osfamily {
    'redhat': {
  file { '/etc/chrony.conf':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/chrony/redhat/server/chrony.conf'
  }
}
     'debian': {
  file { '/etc/chrony/chrony.conf':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/chrony/debian/server/chrony.conf'
  }
 }
}


  service {
    'chrony':
      require     => Package['chrony'],
      ensure      => running,
      enable      => true,
      hasstatus   => true,
      hasrestart  => true;
  }

}
