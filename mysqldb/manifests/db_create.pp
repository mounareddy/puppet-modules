#defining a db_create resource used to create a new database
#This is called in the init file withe values to create a database
define mysqldb::db_create (String $user, String $password) {
    $new_password = $mysqldb::params::new_password
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      command => "/usr/bin/mysql -uroot --password=$new_password -e \"create database ${name}; grant all privileges on ${name}.* to '${user}'@'localhost' identified by '$password'; grant all privileges on ${name}.* to '${user}'@'%' identified by '$password'\"",
      require => Service["mysqld"],
    }
  }
