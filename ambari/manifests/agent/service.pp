class ambari::agent::service {

    service { $::ambari::agent::service_name:
        ensure => $::ambari::agent::service_ensure,
        enable => $::ambari::agent::service_enable,
        provider => "redhat",

    notify { 'inside agent service': }
    service { $::ambari::agent::agent_service_name:
        ensure => $::ambari::agent::agent_service_ensure,
        enable => $::ambari::agent::agent_service_enable,
	      hasstatus => true,

    }
}
