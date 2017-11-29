class ambari::server::config (
    $owner   = 'root',
<<<<<<< HEAD
    #$db_backened = '',
    #$settings = {}
=======
   # $settings = {}
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
) {
    $java_home = $::ambari::params::java_home
    include utils::params

    file {'/etc/ambari-server/conf/ambari.properties':
        ensure => file,
        owner => $owner,
<<<<<<< HEAD
        group => $group,
        mode => '0644',
        content => template('ambari/server/ambari.properties.erb'),
    }

=======
        group => $owner,
        mode => '0644',
	content => template('ambari/server/ambari.properties.erb'),
    }
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    file {'/etc/ambari-server/conf/password.dat':
        ensure => file,
        content => $::utils::params::ambari_password,
        owner => $owner,
        group => $owner,
        mode => '0640',
    }
<<<<<<< HEAD
=======
    
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
}
