# Class for installing squid on linux server
class puppet_homelab::squid {

  user { 'squid':
    ensure      => present,
    shell       => '/bin/sh',
    #shell       => '/usr/sbin/nologin',
    managehome  => true,
    gid         => 'squid',
  }

  group { 'squid':
    ensure  => present,
  }

  package { 
    'squid':  ensure => installed;
    }



  file { '/var/spool/squid':
    ensure => directory,
    owner  => 'squid',
    group  => 'squid',
    mode   => '0750',
    ensure => present,

  }

  file  { '/var/log/squid':
    ensure => directory,
    owner  => 'squid',
    group  => 'squid',
    mode   => '0770',
    ensure => present,

  }


  file  { '/etc/squid/conf.d':
    ensure => directory,
    owner  => 'squid',
    group  => 'squid',
    mode   => '0750',
    ensure => present,

  }

  file  { '/etc/squid/global':
    ensure => directory,
    owner  => 'squid',
    group  => 'squid',
    mode   => '0750',
    ensure => present,

  }


  file { '/etc/squid/global/domain.txt':
     owner  => 'squid',
     group  => 'squid',
     mode   => '0770',
     source => 'puppet:///modules/puppet_homelab/squid/domain.txt'
  }


  file { '/etc/squid/squid.conf':
     owner  => squid,
     group  => squid,
     mode   => '0640',
     ensure => present,
     source => 'puppet:///modules/puppet_homelab/squid/squid.conf'
  }


  file { '/etc/logrotate.d/squid':
     owner  => root,
     group  => root,
     mode   => '0644',
     ensure => present,
     source => 'puppet:///modules/puppet_homelab/logrotate/squid'
  }


  exec {
    'squid_permission':
     path        => ['/bin'],
     command     => 'chown -R squid:squid /var/log/squid && chmod -R 0770 /var/log/squid && chown -R squid:squid /var/spool/squid',
   }


  exec {
    'squid_enable':
     path        => ['/bin'],
     command     => 'systemctl enable squid',
     refreshonly => true;
  }

  exec {
    'squid_restart':
     path        => ['/bin'],
     command     => 'systemctl restart squid',
     refreshonly => true;
  }


}
