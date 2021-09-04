# Install and Configure Puppet Server
class profile::puppet::server {

  $xms = lookup('profiles::puppet::master::server::xms')
  $xmx = lookup('profiles::puppet::master::server::xmx')
  $puppetdb = lookup('profiles::puppetdb::puppetdb_server_hostname')

  class { 'puppetserver::repository': }
  -> class { 'puppetserver':
    config => {
      'java_args' => {
        'xms'         => $xms,
        'xmx'         => $xmx,
        'maxpermsize' => '512m',
        'tmpdir'      => '/tmp',
      },

      'webserver' => {
        'ssl-port' => '8140',
      },
    },
  }


  file_line { 'puppet.conf':
    ensure => present,
    path   => '/etc/puppetlabs/puppet/puppet.conf',
    line   => 'autosign = true',
    after  => '^\[master]',
  }

  file { '/etc/puppetlabs/puppet/autosign.conf':
    ensure => 'file',
    owner  => 'puppet',
    group  => 'puppet',
    #mode   => '0777',
  }

  file_line { 'autosign.conf':
    ensure => present,
    path   => '/etc/puppetlabs/puppet/autosign.conf',
    line   => '*',
  }

#  class { 'puppetdb::master::config':
#    puppetdb_server => $puppetdb
#  }
}
