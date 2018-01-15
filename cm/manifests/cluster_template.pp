class cm::cluster_template (
  $cm_hostname  = $cm::params::cm_hostname,
  $cm_public_ipaddress = $cm::params::cm_public_ipaddress,
  $cm_port      = $cm::params::cm_port,
  $master_hostname = $cm::params::master_hostname,
  $datanode1_hostname = $cm::params::datanode1_hostname,
  $datanode2_hostname = $cm::params::datanode2_hostname,
  $datanode3_hostname = $cm::params::datanode3_hostname,
  $cm_username = $cm::params::cm_username,
  $cm_password = $cm::params::cm_password,
  $mysql_hostname = $cm::params::mysql_hostname,
  $hive_metastore_password = $cm::params::hive_metastore_password,
  ){
    file { '/root/cluster-template.json':
       ensure => 'present',
       owner  => 'root',
       group  => 'root',
       mode   => '644',
       content => template('cm/cluster-template.json.erb')
    }
    exec { "importing the cluster to a new cluster":
      command => "curl -X POST -H \"Content-Type: application/json\" -d @cluster-template.json http://${cm_username}:${cm_password}@${cm_public_ipaddress}:${cm_port}/api/v12/cm/importClusterTemplate",
      cwd     => '/root',
      path    => '/bin',
      require => File['/root/cluster-template.json'],
    }
}
