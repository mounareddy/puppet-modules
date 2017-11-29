<<<<<<< HEAD
class ambari::params inherits ::java::params{
=======
class ambari::params inherits ::java::params {
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    $version                = '2.5.2.0'
    $repo_version           = inline_template('<%= "#{@version.split(\'.\')[0]}.x" %>')
    $service_name           = 'ambari-server'
    $service_ensure         = 'running'
    $service_enable         = true
    $agent_pkg_name         = 'ambari-agent'
    $agent_pkg_ensure       = 'installed'
    $agent_service_name     = 'ambari-agent'
    $agent_service_ensure   = 'running'
    $agent_service_enable   = true
    $agent_use_repo         = true
<<<<<<< HEAD
    $java_home              = "${java::params::java_base}/jdk${java::params::java_version}"
=======
    $java_home              = "${::java::params::java_base}/jdk${::java::params::java_version}"
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
}
