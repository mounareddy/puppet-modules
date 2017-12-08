class mysqldb(
  ) inherits ::mysqldb::params

{
    class {'::mysqldb::install': }
    -> class {'::mysqldb::config':}
    -> class {'::mysqldb::server':}
    #creating scm datanbase by using the define resource defined in db_create.pp
    mysqldb::db_create { "scm":
      user => "scm",
      password => "Scm1234!",
      require => [ Class['::mysqldb::server'] ]
    }
}
