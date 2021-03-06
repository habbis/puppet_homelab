#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin

# fact for https://ubuntu.com/security/CVE-2022-25636
unprivileged_userns_clone="/proc/sys/kernel/unprivileged_userns_clone"
unprivileged_bpf_disabled="/proc/sys/kernel/unprivileged_bpf_disabled"

if test -e $unprivileged_userns_clone
then
        file_unprivileged_userns_clone_exist="true"
else
        file_unprivileged_userns_clone_exist="false"
fi

echo "habbfarm_unprivileged_userns_clone_exist=$file_unprivileged_userns_clone_exist"

if test -e $unprivileged_bpf_disabled
then
        file_unprivileged_bpf_disabled_exist="true"
else
        file_unprivileged_bpf_disabled_exist="false"
fi

echo "habbfarm_unprivileged_bpf_disabled_exist=$file_unprivileged_bpf_disabled_exist"

echo "habbfarm_unprivileged_userns_clone_disable_enabled=$(cat $unprivileged_userns_clone)"