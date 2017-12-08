### This class will make sure that mysql service is up and running
class mysqldb::server (
  $new_password = $mysqldb::params::new_password,
) {
  service { "mysqld":
    enable => true,
    ensure => running,
    before => File["root_password"],
    #require => Package["mysql-server"],
  }
  ##This file resource is used to run the shell script that is used to change the database root user password
  file { 'root_password':
    ensure => file,
    source => "puppet:///modules/mysqldb/rootpass.sh",
    path   => "/tmp/rootpass.sh",
    mode   => "0777",
    require => Service["mysqld"],
  }
  ## This resource will check if the root user is able to login, if failed it will execue the command(runs the shell script)

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$new_password status",
    path => ["/bin", "/usr/bin"],
    command => "/tmp/rootpass.sh",
    require => Service["mysqld"],
  }
}
