class ambari::repo inherits ambari::params {
<<<<<<< HEAD
=======
    package {'wget':
	ensure => installed,		
    }
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    if $::osfamily == 'RedHat' {
        wget::fetch { 'ambari-repo':
            source => "http://public-repo-1.hortonworks.com/ambari/centos${::operatingsystemmajrelease}/${::ambari::params::repo_version}/updates/${::ambari::params::version}/ambari.repo",
            destination => '/etc/yum.repos.d/ambari.repo',
            user => 'root',
            mode => '0644'
        }
    }
}
