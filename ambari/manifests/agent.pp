class ambari::agent (
<<<<<<< HEAD
    $ambari_server              = 'ambariserver.cdl.local',
=======
    $ambari_server              = 'localhost',
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    $ambari_url_port            = '8440',
    $ambari_secured_url_port    = '8441',
    $package_ensure             = $::ambari::params::agent_pkg_name,
    $package_name               = $::ambari::params::agent_pkg_ensure,
    $service_name               = $::ambari::params::agent_service_name,
    $service_enable             = $::ambari::params::agent_service_enable,
    $service_ensure             = $::ambari::params::agent_service_ensure,
<<<<<<< HEAD
=======
      $use_repo                  = $::ambari::params::agent_use_repo
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
) inherits ::ambari::params
{
    include ::ambari::agent::install
    include ::ambari::agent::config
    include ::ambari::agent::service

    Class[::ambari::agent::install]
    -> Class[::ambari::agent::config]
    -> Class[::ambari::agent::service]
}
