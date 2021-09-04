# Debian Repository
class profile::repo::apt {
  if ($facts['os']['distro']['codename'] == 'wheezy') {
    apt::source { 'debian':
      comment  => 'This is the Debian Wheezy mirror',
      location => 'http://archive.debian.org/debian',
      repos    => 'main contrib non-free',
      include  => {
        'src' => true,
        'deb' => true,
      },
    }
  }
  else {
    apt::source { 'debian':
      comment  => 'This is the Debian mirror',
      location => 'http://deb.debian.org/debian/',
      repos    => 'main contrib non-free',
      key      => {
        'id'     => 'A1BD8E9D78F7FE5C3E65D8AF8B48AD6246925553',
        'server' => 'subkeys.pgp.net',
      },
      include  => {
        'src' => true,
        'deb' => true,
      },
    }
  }
}
