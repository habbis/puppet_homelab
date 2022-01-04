#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin

family=$(facter osfamily)

release=$(facter operatingsystemrelease)
os=$( facter operatingsystem )

version="No OpenSSL"

if [ "$family" = "Debian" ]; then
    opensslversion=$(dpkg -l | grep "ii\W*openssl\W*" | awk '{print $3}')
else
    opensslversion=$( rpm -qa --qf "%{VERSION}-%{RELEASE}\n" openssl 2> /dev/null )
fi

[ -n "$opensslversion" ] && version=$opensslversion

echo "habbfarm_openssl_version=$version $os $release"
