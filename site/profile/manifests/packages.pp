# Profile to manage Default Packages

class profile::packages {

  $packages = hiera_hash('profiles::packages')

  $packages_defaults = {
    ensure => present,
  }

  create_resources('package', $packages, $packages_defaults)

}
