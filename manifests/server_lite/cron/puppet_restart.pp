class puppet_homelab::server_lite::cron::puppet_restart {
  unless $::osfamily == 'windows' {
    cron { 'puppet-restart':
      ensure      => 'present',
      environment => 'PATH=/bin:/sbin:/usr/bin:/usr/sbin',
      command     => 'service puppet restart > /dev/null',
      user        => 'root',
      hour        => '22',
      minute      => fqdn_rand(59);
    }
  }
}
