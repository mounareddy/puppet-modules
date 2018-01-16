class cm::management_services (
  $cm_hostname = $cm::params::cm_hostname,
  $cm_username = $cm::params::cm_username,
  $cm_password = $cm::params::cm_password,
  $cluster_name = $cm::params::cluster_name,
  $amon_username = $cm::params::amon_username,
  $amon_password = $cm::params::amon_password,
  $db_type       = $cm::params::db_type,
  $amon_db_name  = $cm::params::amon_db_name,
  $nav_username  = $cm::params::nav_username,
  $nav_password  = $cm::params::nav_password,
  $nav_db_name   = $cm::params::nav_db_name,
  $rman_username = $cm::params::rman_username,
  $rman_password = $cm::params::rman_password,
  $rman_db_name  = $cm::params::rman_db_name,
  )inherits cm::params{
  file{ '/root/setup_cm_mgmt.py':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    content => template('cm/setup_cm_mgmt.py.erb')
  }
  exec { 'Installing the Cloudera Mangament services':
    command => 'python setup_cm_mgmt.py',
    #unless  => '',
    path => '/bin/',
    cwd  => '/root/'
    # refreshonly => true,
  }
}
