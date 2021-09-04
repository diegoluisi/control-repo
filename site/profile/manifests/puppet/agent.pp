# Manage Puppet Agent 
class profile::puppet::agent {

  $puppetmaster = hiera('profiles::puppet::agent::puppetmaster')
  $environment = hiera('profiles::puppet::agent::environment')

  class {'::puppet_agent':
    collection => 'puppet7',
    manage_repo => true,
  }

  class {'puppet':
    runmode       => 'service',
    certname      => $::trusted['certname'],
    puppetmaster  => $puppetmaster,
    environment   => $environment,
  }
}
