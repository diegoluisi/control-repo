#Profile Base - Create users

class profile::users {


  $user_accounts = hiera_hash("profile::users::${::kernel}::users")
  $group_accounts = hiera_hash("profile::users::${::kernel}::groups")
  $ssh_authorized_key = hiera_hash("profile::users::${::kernel}::ssh_authorized_key", undef)
  $provider = hiera("profile::users::${::kernel}::provider")

  $user_defaults = {
    ensure         => present,
    managehome     => true,
    provider       => $provider,
    shell          => '/bin/bash',
    password       => undef,
  }

  $group_defaults = {
    ensure => present,
  }

  $ssh_authorized_key_defaults = {
    ensure => present,
    type   => 'ssh-rsa',
  }

  create_resources('user', $user_accounts, $user_defaults)
  create_resources('group', $group_accounts, $group_defaults)
  create_resources('ssh_authorized_key', $ssh_authorized_key, $ssh_authorized_key_defaults)
}
