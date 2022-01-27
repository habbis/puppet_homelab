#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin

family=$(facter osfamily)

release=$(facter operatingsystemrelease)
os=$( facter operatingsystem )

kernel=$( facter kernel )

date=""


if [ "$kernel" = "Linux" ]; then
    habbfarm=$(cat /etc/resolv.conf | grep "habbfarm.net"|awk '{print $2}')
fi

echo "hf_hosts=$habbfarm"
