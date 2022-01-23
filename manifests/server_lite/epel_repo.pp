# Class for epel repo
class puppet_homelab::server_lite::epel_repo(
  $epel_repo_proxy = ncop::repo::epel_repo_proxy,
  ) {
  if $::osfamily == "RedHat" {
    if $::operatingsystemrelease =~ /^8.*/ {
      validate_string($epel_repo_proxy)
      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL':
        owner  => root,
        group  => root,
        mode   => '0444',
        force  => true,
        source => 'puppet:///modules/ncop/repo/RPM-GPG-KEY-EPEL-8';
      }
    }
    else {
      validate_string($epel_repo_proxy)
      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL':
        owner  => root,
        group  => root,
        mode   => '0444',
        force  => true,
        source => 'puppet:///modules/ncop/repo/RPM-GPG-KEY-EPEL-6';
      }
    }
    if $::operatingsystemrelease =~ /^5.*/ {
      yumrepo { 'epel-repo':
        name                => 'epel-repo',
        #ensure              => present,
        baseurl             => "http://ftp-stud.hs-esslingen.de/pub/Mirrors/archive.fedoraproject.org/epel/${::lsbmajdistrelease}/${::architecture}",
        enabled             => 1,
        gpgcheck            => 0,
        proxy               => $epel_repo_proxy,
        require             => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL'];
      }
    }
    elsif $::operatingsystemrelease =~ /^6.*/ {
      yumrepo { 'epel-repo':
        name                => 'epel-repo',
        #ensure              => present,
        baseurl             => "https://fedora-archive.ip-connect.info/epel/6/x86_64/",
        enabled             => 1,
        gpgcheck            => 0,
        proxy               => $epel_repo_proxy,
        require             => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL'];
      }
    }
    elsif $::operatingsystemrelease =~ /^7.*/ {
      yumrepo { 'epel-repo':
        name                => 'epel-repo',
        #ensure              => present,
        baseurl             => "http://download.fedoraproject.org/pub/epel/${::lsbmajdistrelease}/${::architecture}",
        enabled             => true,
        gpgcheck            => 1,
        repo_gpgcheck       => 0,
        proxy               => $epel_repo_proxy,
        #gpgkey         => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL",
        skip_if_unavailable => true,
        require             => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL'];
      }
    }
    elsif $::operatingsystemrelease =~ /^8.*/ {
      yumrepo { 'epel-repo':
        name                => 'epel-repo',
        #ensure              => present,
        metalink             => 'https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch&infra=$infra&content=$contentdir',
        enabled             => true,
        gpgcheck            => 1,
        repo_gpgcheck       => 0,
        proxy               => $epel_repo_proxy,
        gpgkey          => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL",
        skip_if_unavailable => true,
        require             => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL'];
      }
    }
    else {
      yumrepo { 'epel-repo':
        name                => 'epel-repo',
        #ensure              => present,
        #baseurl             => "https://download.fedoraproject.org/pub/epel/${::lsbmajdistrelease}/Everything/${::architecture}",
        metalink            => "https://mirrors.fedoraproject.org/metalink?repo=epel-$release&arch=$basearch&infra=$infra&content=$contentdir",
        enabled             => true,
        gpgcheck            => 1,
        repo_gpgcheck       => 0,
        proxy               => $epel_repo_proxy,
        #gpgkey              => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL",
        skip_if_unavailable => true,
        require             => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL'];
      }
    }
  }
}
