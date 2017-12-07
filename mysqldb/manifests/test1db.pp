iclass mysqldb::sqlserver {

  class { '::mysql::server':
   root_password    => 'Hadoop123!',
   override_options => { 'mysqld' => { 'max_connections' => '1024' } }
  }
  mysql::db { 'scm':
    user      => 'scm',
    password  => 'Scm1234!',
    host      => $cloudera_server,
  }
  mysql_user { 'scm@localhost':
    ensure    => present,
  }
  mysql_grant { 'scm@localhost/*.*':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => '*.*',
   user       => 'scm@localhost',
 }
}
