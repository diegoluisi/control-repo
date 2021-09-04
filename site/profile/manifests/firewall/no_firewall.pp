# The firewall module lets you manage firewall rules with Puppet.
class profile::firewall::no_firewall {

  class { '::firewall':
    ensure => 'stopped',
  }
}
