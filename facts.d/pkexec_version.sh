#!/bin/bash

export PATH=$PATH:/opt/puppetlabs/bin

version=$(pkexec --version 2>/dev/null)

if [ -z "${version}" ]; then
	version="none"
fi

echo "pkexec_version=$version"
