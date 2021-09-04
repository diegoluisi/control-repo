# Manage Puppet Agent 
class profile::puppet::devel {

  file { '/bin/start_development':
    source => 'puppet:///modules/staging/start_development',
    mode   => 'ug+wx'
  }

}
