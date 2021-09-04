# Manage R10K for puppet
class profile::puppet::r10k {
#  $version = hiera('profiles::puppet::master::r10k_version')

  class { '::r10k':
    cachedir => '/opt/puppetlabs/server/data/puppetserver/r10k',
    #version  => '2.5.1',
    provider => 'puppet_gem',
    sources  => {
      'puppet' => {
        'remote'  => 'git@github.com:dafiti-group/puppet.git',
        'basedir' => '/etc/puppetlabs/code/environments',
    },
  }
}

  file { '/usr/local/bin/prefix_command.rb':
    ensure => file,
    mode   => '0755',
    owner  => 'root',
    group  => '0',
    source => 'puppet:///modules/r10k/prefix_command.rb',
  }

  class { 'r10k::webhook::config':
    use_mcollective => false,
    prefix          => true,
    prefix_command  => '/usr/local/bin/prefix_command.rb',
    enable_ssl      => false,
    protected       => false,
    notify          => Service['webhook'],
    require         => File['/usr/local/bin/prefix_command.rb'],
  }

  # this exposes http[s]://0.0.0.0:8088/<payload|module> for git webhooks
  class { 'r10k::webhook':
    require         => Class['r10k::webhook::config'],
    use_mcollective => false,
    user            => 'root',
    group           => 'root',
  }
}
