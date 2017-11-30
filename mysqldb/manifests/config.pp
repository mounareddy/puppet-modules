class mysqldb::config {
  file {'/etc/my.cfg':
      ensure    => 'present',
      owner     => 'root',
      group     => 'root',
      mode      => '0644',
      content   => template('/mysqldb/templates/my.cfg.erb'),
      require   => Class['::mysqldb::install']
  }
}
