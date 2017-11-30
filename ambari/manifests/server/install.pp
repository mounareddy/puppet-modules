class ambari::server::install(
    $package_name = 'ambari-server'
)
{
    include ::amabri::repo

    package { $package_name:
        ensure => installed,
        require => Class['::ambari::repo']
    }
}
