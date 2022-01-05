#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin

family=$(facter osfamily)

release=$(facter operatingsystemrelease)
os=$( facter operatingsystem )

date=""

if [ "$family" = "Debian" ]; then
    version=$(dpkg-query -l apache2 | grep "ii\W*apache2\W*" | awk '{print $3}')
else
    date=$( rpm -qa --qf "%{INSTALLTIME:date}\n" httpd )
    version=$( rpm -qa --qf "%{VERSION}-%{RELEASE}\n" httpd )
fi

echo "web_version=$version"

