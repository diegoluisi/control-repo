# Manage Default Linux Repository 
class profile::repo {

  case $facts['os']['name'] {
    'RedHat', 'CentOS', 'Amazon':  { include profile::repo::yum  }
    /^(Debian|Ubuntu)$/: { include profile::repo::apt }
    #  default:             { include role::generic } # Apply the generic class
  }
}
