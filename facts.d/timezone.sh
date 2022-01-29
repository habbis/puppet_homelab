#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin


kernel=$( facter kernel )

if [ "$kernel" = "Linux" ]; then
    timezone=$(cat /etc/timezone)
fi

echo "timezone=$timezone"
