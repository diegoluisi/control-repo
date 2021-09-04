# Manage bashrc
class profile::bashrc {

$env = hiera('profiles::bashrc::environment')


  file { '/root/.bashrc':
    content => template('profile/bashrc/bashrc.erb'),
  }


  file { '/root/.bash_profile':
    ensure => present,
  }


  file_line { 'bash_profile_source':
    ensure => present,
    path   => '/root/.bash_profile',
    line   => 'source ~/.bashrc',
  }

  file_line { 'bash_profile':
    ensure => present,
    path   => '/root/.bash_profile',
    line   => 'export HISTTIMEFORMAT="%d/%m/%y %T "',
  }


  file_line { 'bash_path':
    ensure => present,
    path   => '/root/.bash_profile',
    line   => 'PATH=$PATH:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/puppetlabs/puppet/bin/:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin',
    match  => '^PATH',
  }
}
