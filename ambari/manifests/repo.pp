class ambari::repo inherits ambari::params {
    # TODO check if this is required
    package {'wget':
	     ensure => installed,
    }

    if $::osfamily == 'RedHat' {
        wget::fetch { 'ambari-repo':
            source => "http://public-repo-1.hortonworks.com/ambari/centos${::operatingsystemmajrelease}/${::ambari::params::repo_version}/updates/${::ambari::params::version}/ambari.repo",
            destination => '/etc/yum.repos.d/ambari.repo',
            user => 'root',
            mode => '0644'
        }
    }
}
