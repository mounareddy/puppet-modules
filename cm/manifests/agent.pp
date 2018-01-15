class cm::agent (
  $agent_ensure = $cm::params::agent_ensure,
  $agent_enable = $cm::params::agent_enable
)inherits cm::params {
  package { 'cloudera-manager-agent':
    ensure => installed,
  }
  #package { 'cloudera-manager-daemons':
  #  ensure => installed,
  #  require => Package['cloudera-manager-agent'],
 # }

  file { '/etc/cloudera-scm-agent/config.ini':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('cm/agent-config.ini.erb'),
    require => Service['cloudera-scm-agent'],
    #notify  => Service['cloudera-scm-agent'],
    #require => Package['cloudera-manager-agent'],
  }
  service { 'cloudera-scm-agent':
    ensure => $agent_ensure,
    enable => $agent_enable,
    hasrestart => true,
    hasstatus  => true,
    status     => '/sbin/service cloudera-scm-agent status | /bin/grep "active"',
    require    => Package['cloudera-manager-agent']
    #require    => File['/etc/cloudera-scm-agent/config.ini'],
    # pattern => 'cloudera',
  }
}
