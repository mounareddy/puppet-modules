class ambari::agent::service {
    notify { 'inside agent service': }
    service { $::ambari::agent::agent_service_name:
        ensure => $::ambari::agent::agent_service_ensure,
        enable => $::ambari::agent::agent_service_enable,
	hasstatus => true,
	provider => "redhat",
    }
}
