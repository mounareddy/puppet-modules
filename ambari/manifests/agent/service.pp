class ambari::agent::service {
<<<<<<< HEAD
    service { $::ambari::agent::service_name:
        ensure => $::ambari::agent::service_ensure,
        enable => $::ambari::agent::service_enable,
        provider => "redhat",
=======
    notify { 'inside agent service': }
    service { $::ambari::agent::agent_service_name:
        ensure => $::ambari::agent::agent_service_ensure,
        enable => $::ambari::agent::agent_service_enable,
	hasstatus => true,
	provider => "redhat",
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    }
}
