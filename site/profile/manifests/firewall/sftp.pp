# The firewall module lets you manage firewall rules with Puppet.
class profile::firewall::sftp {

  $firewall_rules = hiera('profile::sftp::firewall')

#  class { '::firewall':
#    ensure => 'stopped',
#  }

  $firewall_defaults =  {
    dport  => [22],
    proto  => tcp,
    action => accept,
  }

  create_resources('firewall', $firewall_rules, $firewall_defaults)

}
