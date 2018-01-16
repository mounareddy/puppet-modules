class cm::server (
  $db_type = $cm::params::db_type,
  $db_user = $cm::params::db_user,
  $db_pass = $cm::params::db_pass,
  $database_name = $cm::params::database_name,
  $service_ensure = $cm::params::service_ensure,
  $service_enable = $cm::params::service_enable,
)inherits cm::params {
  require mysqldb

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
    status     => 'service cloudera-scm-server status | grep "active"',
    require    => Package["cloudera-manager-server"],
  }
  #Preparing a Cloudera Manager Server External Database

  exec { 'scm_prepare_database':
    command => "/usr/share/cmf/schema/scm_prepare_database.sh ${db_type} ${database_name} ${db_user} ${db_pass} ",
    creates => '/etc/cloudera-scm-server/.scm_prepare_database',
    unless  => 'ls /etc/cloudera-scm-server | grep db.properties',
    before  => Service["cloudera-scm-server"],
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
  }
  #adding spark to the cluster
  file {'/opt/cloudera/csd/SPARK2_ON_YARN-2.2.0.cloudera1.jar':
    ensure => 'present',
    owner  => 'cloudera-scm',
    group  => 'cloudera-scm',
    mode   => '0644',
    source => "puppet:///modules/cm/SPARK2_ON_YARN-2.2.0.cloudera1.jar",
    require=> Exec['scm_prepare_database'],
    before => Service['cloudera-scm-server'],
  }
}
