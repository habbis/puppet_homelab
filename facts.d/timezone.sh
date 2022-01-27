#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin


kernel=$( facter kernel )

if [ "$kernel" = "Linux" ]; then
    #timzone=$(grep "Europe/Oslo" /etc/timezone |awk '{print $2}')
    timezone=$(cat /etc/timezone)
fi

echo "timezone=$timezone"
