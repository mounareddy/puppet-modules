class cm::params {
   $cm_reposerver = "https://archive.cloudera.com",
   $cm_version    = "5",
   $db_type       = "mysql",
   $db_user       = "scm",
   $db_pass       = "Scm1234!",
   $database_name = "scm",
   $service_ensure = "running",
   $service_enable = "true",

   case $::operatingsystem {
     'CentOs','RedHat': {
       # $cm_gpgkey  = cm5/redhat/7/x86_64/cm/RPM-GPG-KEY-cloudera
       $cm_gpgkey = "/cm${cm_version}/redhat/${::operatingsystemmajrelease}/${::architecture}/cm/RPM-GPG-KEY-cloudera"
       # $yumpath   = cm5/redhat/7/x86_64/cm/5/
       $cm_yumpath   = "cm${cm_version}/redhat/${::operatingsystemmajrelease}/${::architecture}/cm/${cm_version}"
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
