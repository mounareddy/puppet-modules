class ambari::server::service (
    $service_name   = $::ambari::params::service_name,
    $service_enable = $::ambari::params::service_enable,
    $service_ensure = $::ambari::params::service_ensure,
)
{
    if ::osfamily == 'RedHat' {
        Service[$service_name] {
            hasstaus => false,
            pattern  => 'java .*org\.apache\.ambari\.server\.controller\.AmbariServer'
        }
    }

    service {$service_name:
        ensure => $service_ensure,
        enable => $service_enable,
    }
}
