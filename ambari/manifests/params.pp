class ambari::params inherits ::java::params {
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
    $java_home              = "${::java::params::java_base}/jdk${::java::params::java_version}"
}
