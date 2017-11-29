class ambari::blueprint {
  file { '/tmp/blueprint.json':
      ensure => file,
      owner  => root,
      group  => root,
      mode   => '0755',
      content => template('ambari/blueprint.json.erb'),
  }
  # Registering blueprint with ambari server
  exec { 'importblueprint':
    command => 'curl -H "X-Requested-By: ambari" -X POST -u admin:admin http://localhost:8080/api/v1/blueprints/multinodeHDP -d @blueprint.json',
    path => '/bin',
    cwd => '/tmp/',
    user => 'root',
    require => File['/tmp/blueprint.json'],
    # refreshonly => true,
  }
}
