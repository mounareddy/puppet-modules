class mysqldb(
  ) inherits ::mysqldb::params

{
    class {'::mysqldb::install': }
    -> class {'::mysqldb::config':}
    -> class {'::mysqldb::server':}
    mysqldb::db_create { "scm":
      user => "scm",
      password => "Scm1234!",
      require => [ Class['::mysqldb::server'] ]
    }
}
