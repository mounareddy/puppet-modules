#Adding the my.cfg file from the templates folder into /etc/ on the host
class mysqldb::config {
  file {'/etc/my.cnf':
      owner     => 'root',
      group     => 'root',
      mode      => '0644',
      content   => template('mysqldb/my.cnf.erb'),
      # ensure    => "/var/lib/mysql/my.cnf",
      # require   => File["/var/lib/mysql/my.cnf"],
  }
}
