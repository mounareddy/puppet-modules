
define mysqldb::db_create (String $user, String $password) {
    $new_password = $mysqldb::params::new_password
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      command => "/usr/bin/mysql -uroot --password=$new_password -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysqld"],
    }
  }
