class ambari::agent::install {
    require ambari::repo
    Class['::ambari::repo'] -> Package[$::ambari::agent::package_name]

    package { $::ambari::agent::package_name:
        ensure => $::ambari::agent::package_ensure,
    }
}
