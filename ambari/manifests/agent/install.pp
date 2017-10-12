class ambari::agent::install {

    contain ::ambari::repo
    Class['::ambari::repo'] -> Package[$::ambari::agent::agent_pkg_name]
 
    package { $::ambari::agent::agent_pkg_name:
        ensure => $::ambari::agent::agent_pkg_ensure,
    }
}
