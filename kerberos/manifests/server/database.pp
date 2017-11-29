class kerberos::database inherits kerberos::install {
  exec {'creating kerberos database':
    command => 'kdb5_util -P kdc create -s ',
    user => 'root',
    require => Class[::kerberos::config]
  }
  exec { "addprinc_for_admin":
     path => /usr/sbin/kadmin.local,
     command => "addprinc -pw root/admin",
     unless => "kadmin -p root/admin -w root -q list_principals | grep root/admin $principal",
     require => Exec["creating kerberos database"],

   }

}
