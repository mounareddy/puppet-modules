class mysqldb::server (
  $new_password = $mysqldb::params::new_password,
) {

  file { 'root_password':
    ensure => file,
    source => "puppet:///modules/mysqldb/rootpass.sh",
    path   => "/tmp/rootpass.sh",
    mode   => "0777",
    require => Service["mysqld"],
  }
  service { "mysqld":
    enable => true,
    ensure => running,
    before => File["root_password"],
    #require => Package["mysql-server"],
  }
  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$new_password status",
    path => ["/bin", "/usr/bin"],
    command => "/tmp/rootpass.sh",
    require => Service["mysqld"],
  }
}
