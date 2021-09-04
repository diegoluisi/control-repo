#Role Puppet Server - Devel
class role::puppet::devel {
  include profile::common
  include profile::puppet::server
  include profile::puppet::hiera
  include profile::puppet::r10k
  include profile::puppet::lint
  include profile::firewall::no_firewall
}

