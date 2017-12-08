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
    # mysqldb::db_create { "amon":
    #   user => "amon",
    #   password => "Amon1234!",
    #   require => [ Class['::mysqldb::server'] ]
    # }
    # mysqldb::db_create { "rmon":
    #   user => "rmon",
    #   password => "Rmon1234!",
    #   require => [ Class['::mysqldb::server'] ]
    # }
    # mysqldb::db_create { "metsatore":
    #   user => "hive",
    #   password => "Hive1234!",
    #   require => [ Class['::mysqldb::server'] ]
    # }
    # mysqldb::db_create { "sentry":
    #   user => "sentry",
    #   password => "Sentry1234!",
    #   require => [ Class['::mysqldb::server'] ]
    # }
    # mysqldb::db_create { "nav":
    #   user => "nav",
    #   password => "Nav1234!",
    #   require => [ Class['::mysqldb::server'] ]
    # }
    # mysqldb::db_create { "navms":
    #   user => "navms",
    #   password => "Navms1234!",
    #   require => [ Class['::mysqldb::server'] ]
    # }
}
