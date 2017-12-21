class cm::params {
  $cm_reposerver = 'https://archive.cloudera.com'
  $cm_version    = '5'
  $db_type       = 'mysql'
  $db_user       = 'scm'
  $db_pass       = 'Scm1234!'
  $database_name = 'scm'
  $service_ensure = 'running'
  $service_enable = 'true'
  $agent_ensure   = 'running'
  $agent_enable   = 'true'
  $server_host    = 'localhost'
  $server_port    = '7182'
  $hive_metastore_password   = ''
  $cm_hostname = ''
  $cm_port = '7180'
  $mysql_hostname  = ''
  $master_hostname = ''
  $datanode1_hostname = ''
  $datanode2_hostname = ''
  $datanode3_hostname = ''
  $cm_username  = ''
  $cm_password  = ''
  $mysql_hostname = ''
  $hive_metastore_password = ''
  $

   case $::operatingsystem {
     'CentOs','RedHat': {
       # $cm_gpgkey  = cm5/redhat/7/x86_64/cm/RPM-GPG-KEY-cloudera
     $cm_gpgkey = "/cm${cm_version}/redhat/${::operatingsystemmajrelease}/${::architecture}/cm/RPM-GPG-KEY-cloudera"
       # $yumpath   = cm5/redhat/7/x86_64/cm/5/
     $cm_yumpath   = "/cm${cm_version}/redhat/${::operatingsystemmajrelease}/${::architecture}/cm/${cm_version}/"
     }
     'Ubuntu': {
       #/cm5/ubuntu/trusty/amd64/cm
       $cm_aptpath = "/cm${cm_version}/ubuntu/${::lsbdistcodename}/${::architecture}/cm"
       #trusty-cm5
       $cm_aptrelease = "${::lsbdistcodename}-cm${cm_version}"
       #contrib
       $cm_aptrepos = "contrib"

     }
   }
}
