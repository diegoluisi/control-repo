# Change Motd Message
class profile::motd {

  $motd_content = hiera('profiles::motd::motd_content')
  $issue_content = hiera('profiles::motd::issue_content')
  $issue_net_content = hiera('profiles::motd::issue_net_content')

  class { '::motd':
      content            => $motd_content,
      issue_template     => 'profile/motd/issue.erb',
      issue_net_template => 'profile/motd/issue.erb',
  }
}
