class cm::setup_kerberos(
  $cm_hostname = $cm::params::cm_hostname,
  $cm_username = $cm::params::cm_username,
  $cm_password = $cm::params::cm_password,
  $cluster_name = $cm::params::cluster_name,
  $cdh_version  = $cm::params::cdh_version,
  $cdh_full_version = $cm::params::cdh_full_version,
  $kdc_hostname = $cm::params::kdc_hostname,
  $kdc_status   = $cm::params::kdc_status,
  $realm_caps   = $cm::params::realm_caps ,
  $kdc_username = $cm::params::kdc_username,
  $kdc_password = $cm::params::kdc_password,
  $ssh_user     = $cm::params::ssh_user,
  $cloudera_principal_password = $cm::params::cloudera_principal_password,
  $hbase_master_node  = $cm::params::hbase_master_node,
  )inherits cm::params {
  file{ '/root/setup_cm_api_kerberos.py':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    content => template('cm/setup_cm_api_kerberos.py.erb')
  }
  exec { 'Setting up kerberos on the Cloudera Manager':
    command => 'python setup_cm_api_kerberos.py',
    #unless  => '',
    path => '/bin/',
    cwd  => '/root/'
  }
