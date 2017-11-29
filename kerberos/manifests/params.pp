class kerberos::params {
  $domain = cdl.local
  $kdc_server =
  $admin_server =
  $principal          = 'root/admin'
  $package_name_kdc    = 'krb5-server'
  $service_name_kdc    = 'krb5kdc'
  $package_name_admin  = 'krb5-libs'
  $service_name_admin  = 'kadmin'
  $package_name_client = 'krb5-workstation'
  $exec_path           = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/kerberos/sbin:/usr/kerberos/bin'
  $kdc_etc_path        = '/var/kerberos/krb5kdc/'
}
