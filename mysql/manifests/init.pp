# puppet module install puppetlabs-mysql
class mysql {

  class { '::mysql::server':
  root_password    => 'mysql123',
  }
    mysql::db { 'scm',
    user      => 'scm',
    password  => 'Scm1234!',
    host      => "@clouderaserver"
  }
  mysql_grant { 'scm':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => '*.*',
   user       => 'scm@localhost',
 }
  mysql::db { 'amon',
    user      => 'amon',
    password  => 'Amon1234!',
    host      => "@clouderaserver"
  }
  mysql_grant { 'amon':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => '*.*',
   user       => 'amon@localhost',
 }
 mysql::db { 'rmon',
   user      => 'rmon',
   password  => 'Rmon1234!',
   host      => "@clouderaserver"
 }
 mysql_grant { 'rmon':
  ensure     => 'present',
  options    => ['GRANT'],
  privileges => ['ALL'],
  table      => '*.*',
  user       => 'rmon@localhost',
  }
  mysql::db { 'metastore',
    user      => 'hive',
    password  => 'Hive1234!',
    host      => "@clouderaserver"
  }
  mysql_grant { 'metastore':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => '*.*',
   user       => 'hive@localhost',
 }
 mysql::db { 'sentry',
   user      => 'sentry',
   password  => 'Sentry1234!',
   host      => "@clouderaserver"
 }
 mysql_grant { 'sentry':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'sentry@localhost',
 }
 mysql::db { 'nav',
   user      => 'nav',
   password  => 'Nav1234!',
   host      => "@clouderaserver"
 }
  mysql_grant { 'nav':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'nav@localhost',
  }
  mysql::db { 'navms',
    user      => 'navms',
    password  => 'Navms1234!',
    host      => "@clouderaserver"
  }
   mysql_grant { 'navms':
     ensure     => 'present',
     options    => ['GRANT'],
     privileges => ['ALL'],
     table      => '*.*',
     user       => 'navms@localhost',
   }
   mysql::db { 'oozie',
     user      => 'oozie',
     password  => 'Oozie1234!',
     host      => "@clouderaserver"
   }
    mysql_grant { 'oozie':
      ensure     => 'present',
      options    => ['GRANT'],
      privileges => ['ALL'],
      table      => '*.*',
      user       => 'oozie@localhost',
    }

}
