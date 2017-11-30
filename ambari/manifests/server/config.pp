class ambari::server::config (
    $owner   = 'root',
) {
    $java_home = $::ambari::params::java_home
    include utils::params

    file {'/etc/ambari-server/conf/ambari.properties':
        ensure => file,
        owner => $owner,
        group => $group,
        mode => '0644',
        content => template('ambari/server/ambari.properties.erb'),
    }
        group => $owner,
        mode => '0644',
	content => template('ambari/server/ambari.properties.erb'),
    }

    file {'/etc/ambari-server/conf/password.dat':
        ensure => file,
        content => $::utils::params::ambari_password,
        owner => $owner,
        group => $owner,
        mode => '0640',
    }
}
