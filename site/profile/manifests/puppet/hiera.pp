# Manage Puppet Hiera Module
class profile::puppet::hiera {

  class {'::hiera':
    hiera_version           =>  '5',
    hiera5_defaults         =>  {'datadir' => 'data', 'data_hash' => 'yaml_data'},
    hierarchy               => [
      {
        'name'       =>  'Node yaml file',
        'path'       =>  'nodes/%{trusted.certname}.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
      {
        'name'       =>  'AWS TAG System yaml file',
        'path'       =>  'app/%{::ec2_tag_system}.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
      {
        'name'       =>  'Environment yaml file',
        'path'       =>  'environment/%{::environment}.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
      {
        'name'       =>  'Site yaml file',
        'path'       =>  'site/%{::environment}.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
      {
        'name'       =>  'OS Family yaml file',
        'path'       =>  'OS/%{::osfamily}.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
      {
        'name'       =>  'OS Family Major Release file',
        'path'       =>  'OS/%{::osfamily}-%{::operatingsystemmajrelease}.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
      {
        'name'       =>  'OS Major Release yaml file',
        'path'       =>  'OS/%{::operatingsystem}-%{::operatingsystemmajrelease}.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
      {
        'name'       =>  'Default yaml file',
        'path'       =>  'common.yaml',
        'lookup_key' => 'eyaml_lookup_key',
      },
    ],
    datadir                 => '/etc/puppetlabs/code/environments/%{::environment}/data',
    eyaml_datadir           => '/etc/puppetlabs/code/environments/%{::environment}/data',
    eyaml                   => true,
    eyaml_extension         => 'yaml',
    create_keys             => true,
    puppet_conf_manage      => true,
    provider                => 'puppetserver_gem',
    cmdpath                 => '/opt/puppetlabs/puppet/bin/',
    hiera_yaml              => '/etc/puppetlabs/puppet/hiera.yaml',
    manage_package          => true,
    eyaml_pkcs7_private_key => '/etc/puppetlabs/puppet/keys/private_key.pkcs7.pem',
    eyaml_pkcs7_public_key  =>  '/etc/puppetlabs/puppet/keys/public_key.pkcs7.pem',
  }
}
