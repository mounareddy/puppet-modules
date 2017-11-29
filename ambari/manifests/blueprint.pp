class ambari::blueprint {

  file { '/tmp/blueprint.json':
      ensure => file,
      owner  => root,
      group  => root,
      mode   => root,
      content => template['ambari/blueprint.json.erb'],
      require => Class['::ambari::server'],
  }
  # Registering blueprint with ambari server
  exec { 'importblueprint':
    command => 'curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://agent1.cdl.local:8080/api/v1/blueprints/multinodeHDP -d @blueprint.json',
    path => '/bin',
    cwd => '/tmp/',
    user => 'root',
    require => File['/tmp/blueprint.json'],
    # refreshonly => true,
  }
}
