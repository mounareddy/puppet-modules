# puppet module install puppetlabs-mysql
class mysqldb(
  String $cloudera_server       = $mysqldb::params::cloudera_server,
  String $activitymanager_node  = $mysqldb::params::activitymanager_node,
  String $rmon_node             = $mysqldb::params::rmon_node,
  String $hive_node             = $mysqldb::params::hive_node,
  String $oozie_node            = $mysqldb::params::oozie_node,
  String $sentry_node           = $mysqldb::params::sentry_node,
  String $navigator_node        = $mysqldb::params::navigator_node,
  String $navms_node            = $mysqldb::params::navms_node,
) inherits ::mysqldb::params {
  class { '::mysql::server':
  root_password    => 'mysql123',
  }
  mysql::db { 'scm':
    user      => 'scm',
    password  => 'Scm1234!',
    host      => $cloudera_server
  }
  mysql_grant { 'scm':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => '*.*',
   user       => 'scm@localhost',
 }
  mysql::db { 'amon':
    user      => 'amon',
    password  => 'Amon1234!',
    host      => $activitymanager_node
  }
  mysql_grant { 'amon':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => '*.*',
   user       => 'amon@localhost',
 }
 mysql::db { 'rmon':
   user      => 'rmon',
   password  => 'Rmon1234!',
   host      => $rmon_node
 }
 mysql_grant { 'rmon':
  ensure     => 'present',
  options    => ['GRANT'],
  privileges => ['ALL'],
  table      => '*.*',
  user       => 'rmon@localhost',
  }
  mysql::db { 'metastore':
    user      => 'hive',
    password  => 'Hive1234!',
    host      => $hive_node
  }
  mysql_grant { 'metastore':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => '*.*',
   user       => 'hive@localhost',
 }
 mysql::db { 'sentry':
   user      => 'sentry',
   password  => 'Sentry1234!',
   host      => $sentry_node
 }
 mysql_grant { 'sentry':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'sentry@localhost',
 }
 mysql::db { 'nav':
   user      => 'nav',
   password  => 'Nav1234!',
   host      => $navigator_node
 }
  mysql_grant { 'nav':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'nav@localhost',
  }
  mysql::db { 'navms':
    user      => 'navms',
    password  => 'Navms1234!',
    host      => $navms_node
  }
   mysql_grant { 'navms':
     ensure     => 'present',
     options    => ['GRANT'],
     privileges => ['ALL'],
     table      => '*.*',
     user       => 'navms@localhost',
   }
   mysql::db { 'oozie':
     user      => 'oozie',
     password  => 'Oozie1234!',
     host      => $oozie_node
   }
    mysql_grant { 'oozie':
      ensure     => 'present',
      options    => ['GRANT'],
      privileges => ['ALL'],
      table      => '*.*',
      user       => 'oozie@localhost',
    }
    class {'::mysqldb::install': }
    -> class {'::mysqldb::config': }
    -> class {'::mysqldb::service':}

}
