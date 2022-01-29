#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin


kernel=$( facter kernel )

timezone=$( facter timezone )

if [ ! "$timezone" = "Europe/Oslo" ]; then
    timezone=$(echo "not Norway")
fi

echo "check_timezone_norway=$timezone"
