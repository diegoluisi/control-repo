#!/bin/bash

rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppet-20250406
rpm -Uvh http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm
yum install -y puppet-agent

/opt/puppetlabs/bin/puppet resource package nss ensure=latest
/opt/puppetlabs/bin/puppet resource package curl ensure=latest
/opt/puppetlabs/bin/puppet resource package libcurl ensure=latest


/opt/puppetlabs/bin/puppet agent -t --server puppetserver.hacklab
