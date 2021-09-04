# This will setup and install vim with some a custom .vimrc and .vim directory that allow you to write Puppet code with ease.

class profile::puppet::lint {



  package { 'puppet-lint':
    ensure   => 'present',
    provider =>  'puppet_gem'
  }

  vim::vim_profile { 'root':
    puppet_lint => '/opt/puppetlabs/puppet/bin/puppet-lint',
  #  require     => Package['puppet-lint'],
  }
}
