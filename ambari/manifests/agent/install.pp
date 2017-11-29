class ambari::agent::install {
<<<<<<< HEAD
    require ambari::repo
    Class['::ambari::repo'] -> Package[$::ambari::agent::package_name]

    package { $::ambari::agent::package_name:
        ensure => $::ambari::agent::package_ensure,
=======

    contain ::ambari::repo
    Class['::ambari::repo'] -> Package[$::ambari::agent::agent_pkg_name]
 
    package { $::ambari::agent::agent_pkg_name:
        ensure => $::ambari::agent::agent_pkg_ensure,
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    }
}
