#!/bin/bash
CONTROL_REPO="git@github.com:diegoluisi/control-repo.git"

rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppet-20250406
rpm -Uvh http://yum.puppetlabs.com/puppet-release-el-7.noarch.rpm
yum install -y puppet-agent

### Install Packages
/opt/puppetlabs/bin/puppet resource package git ensure=latest
/opt/puppetlabs/bin/puppet resource package nss ensure=latest
/opt/puppetlabs/bin/puppet resource package curl ensure=latest
/opt/puppetlabs/bin/puppet resource package libcurl ensure=latest
/opt/puppetlabs/bin/puppet resource package puppetserver ensure=present 
/opt/puppetlabs/bin/puppet resource package r10k ensure=present provider=puppet_gem

### DISABLE IPV6
#cat >> /etc/sysctl.conf <<EOF
#net.ipv6.conf.all.disable_ipv6 = 1
#net.ipv6.conf.default.disable_ipv6 = 1
#EOF
#sysctl -p

### Config Agent
cat > /etc/puppetlabs/puppet/puppet.conf <<EOF
[main]
  certname = $(hostname --fqdn)
  server = $(hostname --fqdn)
EOF
mkdir /etc/puppetlabs/r10k

### Configure R10K
cat > /etc/puppetlabs/r10k/r10k.yaml <<EOF
---
:cachedir: /opt/puppetlabs/server/data/puppetserver/r10k
:sources:
  puppet:
    basedir: /etc/puppetlabs/code/environments
    remote: $CONTROL_REPO
EOF

### Ajust Puppet Server Resources
sed -i -e 's/2g/512m/g' /etc/sysconfig/puppetserver
echo "START_TIMEOUT=300" >> /etc/sysconfig/puppetserver

### Run Puppet
/opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true
/opt/puppetlabs/puppet/bin/r10k puppet install --puppetfile /etc/puppetlabs/code/environments/production/Puppetfile --moduledir /etc/puppetlabs/code/environments/production/modules
/opt/puppetlabs/bin/puppet apply -e 'include role::puppet::devel' --environment production
