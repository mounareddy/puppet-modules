class ambari::server::install(
    $package_name = 'ambari-server'
)
{
<<<<<<< HEAD
    include ::amabri::repo

    package { $package_name:
        ensure => installed,
        require => Class['::ambari::repo']
=======
    include ::ambari::repo

    package { $package_name:
        ensure => installed,
	require => Class['::ambari::repo'],
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    }
}
