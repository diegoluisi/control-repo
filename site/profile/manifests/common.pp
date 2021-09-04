# Default Site Profile
class profile::common {

    notify { 'Apply Profile Common - BR':}
    include profile::repo
    include profile::bashrc
    include profile::motd
    include profile::sudoers
    include profile::users
    include profile::puppet::agent
    include profile::packages

    #include profile::hosts
    #include profile::awscli
    #include profile::crontab
    #include profile::filebeat
    #include profile::ntp
    #include profile::timezone
    ##include profile::resolv
    #include profile::selinux
    ##include profile::snmp
    ##include profile::cloudhealth
    ##include profile::awscloudwatchagent
    #include profile::ssh
    #include profile::zabbix::agent # Fix Files
}
