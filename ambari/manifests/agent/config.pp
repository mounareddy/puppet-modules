class ambari::agent::config() {
    $ambari_server = $::ambari::agent::ambari_server
    $ambari_url_port = $::ambari::agent::ambari_url_port
    $ambari_secured_url_port = $::ambari::agent::ambari_secured_url_port

    file {'/etc/ambari-agent/conf/ambari-agent.ini':
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => template('ambari/agent/ambari-agent.ini.erb'),
        require => Class['::ambari::agent::install'],
    }
}
