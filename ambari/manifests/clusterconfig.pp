class ambari::clusterconfig {
  file { '/tmp/clusterconfig.json':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    content => template['ambari/clusterconfig.json.erb'],
    require => Class['::ambari::blueprint'],
  }
  file {'/tmp/cluster-install.sh':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    content => template['ambari/cluster-install.sh.erb'],
    require => File['/tmp/clusterconfig.json'],
  }
  exec { 'clusterconfig':
    command => 'sh /tmp/cluster-install.sh',
    cwd     => '/tmp',
    user    => 'root',
    require => File['/tmp/cluster-install.sh'],
    path    => "/bin",
  }
}
