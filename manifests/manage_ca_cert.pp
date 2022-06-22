# Class to manage ca cert Linux
class puppet_homelab::manage_ca_cert {

  case $::osfamily {
    'redhat': {
  file {
      '/etc/pki/ca-trust/snakeoil.crt':
        ensure  => 'file',
        source  => 'puppet:///modules/puppet_homelab/ca_cert/snakeoil.crt',
        mode    => '0644';
    }
   exec {
    'import_ca_rhel':
     path        => ['/usr/bin'],
     command     => 'update-ca-trust',
     subscribe   => File['/etc/pki/ca-trust/snakeoil.crt'],
     refreshonly => true;
  }
}
     'debian': {
  file {
      '/usr/local/share/ca-certificates/snakeoil.crt':
        ensure  => 'file',
        source  => 'puppet:///modules/puppet_homelab/ca_cert/snakeoil.crt',
        mode    => '0644';
    }
  exec {
    'import_ca_debian':
     path        => ['/usr/sbin'],
     command     => 'update-ca-certificates',
     subscribe   => File['/usr/local/share/ca-certificates/ncop-rootca-p01.crt'],
     refreshonly => true;
  }
  }
 }
}
