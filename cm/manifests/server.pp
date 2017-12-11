class cm::server {
  $db_type = $cm::params::db_type,
  $db_user = $cm::params::db_user,
  $db_pass = $cm::params::db_pass,
  $database_name = $cm::params::database_name,
  $service_ensure = $cm::params::service_ensure,
  $service_enable = $cm::params::service_enable,

  package { 'cloudera-manager-server':
      ensure => installed,
  }
  package { 'cloudera-manager-daemons':
      ensure => installed,
  }
  service { 'cloudera-scm-server':
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['cloudera-manager-server'],
  }
  #Preparing a Cloudera Manager Server External Database

  exec { 'scm_prepare_database':
    command => "/usr/share/cmf/schema/scm_prepare_database.sh ${db_type} ${database_name} --user=${db_user} --password=${db_pass} ",
    creates => '/etc/cloudera-scm-server/.scm_prepare_database',
    before  => Service['cloudera-scm-server'],
  }
}
