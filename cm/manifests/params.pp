class cm::params {
  $cm_reposerver        = 'https://archive.cloudera.com'
  $cm_version           = '5'
  $db_type              = 'mysql'
  $db_port              = '3306'
  $db_user              = 'scm'
  $db_pass              = 'Scm1234!'
  $database_name        = 'scm'
  $service_ensure       = 'running'
  $service_enable       = 'true'
  $agent_ensure         = 'running'
  $agent_enable         = 'true'
  $server_host          = 'changeme'
  $server_port          = '7182'
  $cm_hostname          = 'changeme'
  $cm_public_ipaddress  = 'changeme'
  $cm_port              = '7180'
  $mysql_hostname       = 'changeme'
  $master_hostname      = 'changeme'
  $datanode1_hostname   = 'changeme'
  $datanode2_hostname   = 'changeme'
  $datanode3_hostname   = 'changeme'
  $cm_username          = 'changeme'
  $cm_password          = 'changeme'
  $cluster_name         = 'changeme'
  $hive_metastore_password = 'changeme'
  $kdc_hostname         = 'changeme'
  $realm_caps           = 'changeme'
  $realm_in_small       = 'changeme'
  $cdh_version          = 'changeme'
  $cdh_full_version     = 'changeme'
  $kdc_status           = 'changeme'
  $kdc_username         = 'changeme'
  $kdc_password         = 'changeme'
  $ssh_user             = 'changeme'
  $cloudera_principal_password = 'changeme'
  $hbase_master_node    = 'changeme'
  $amon_username        = 'changeme' #amon
  $amon_password        = 'changeme' #AMON1234!
  $amon_db_name         = 'changeme' #amon
  $nav_username         = 'changeme' #nav
  $nav_password         = 'changeme' #Nav1234!
  $nav_db_name          = 'changeme' #nav
  $rman_username        = 'changeme' #rmon
  $rman_password        = 'changeme' #Rmon1234!
  $rman_db_name         = 'changeme' #rmon

   case $::operatingsystem {
     'CentOs','RedHat': {
       # $cm_gpgkey  = /cm5/redhat/7/x86_64/cm/RPM-GPG-KEY-cloudera
     $cm_gpgkey = "/cm${cm_version}/redhat/${::operatingsystemmajrelease}/${::architecture}/cm/RPM-GPG-KEY-cloudera"
       # $yumpath   = /cm5/redhat/7/x86_64/cm/5/
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
