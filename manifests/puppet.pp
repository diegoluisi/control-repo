# Puppet Servers
## Puppet Server Development
node 'puppetserver.hacklab' {
  include role::puppet::devel
}

## Puppet Client for Development
node 'centos7.hacklab', 'debian7.hacklab' {
   include role::puppet::test
}

