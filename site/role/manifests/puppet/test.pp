# Role Teste Server
class role::puppet::test {
  notify { 'Apply Role Teste - Puppet Devel':}
  include profile::common
  }
