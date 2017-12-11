class cm::agent {
  $agent_ensure = $cm::params::agent_ensure,
  $agent_enable = $cm::params::agent_enable,

  package { 'cloudera-manager-agent':
    ensure => installed,
  }
  package { 'cloudera-manager-daemons':
    ensure => installed,
    require => Package['cloudera-manager-agent'],
  }
  service { 'cloudera-scm-agent':
    ensure => $agent_ensure,
    enable => $agent_enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['cloudera-manager-agent']
    # pattern => 'cloudera',
  }
  file { '/etc/cloudera-scm-agent/config.ini':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template['cm/agent-config.ini.erb'],
    require => Service['cloudera-scm-agent'],
  }
}
