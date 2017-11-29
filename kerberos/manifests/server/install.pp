class kerberos::install inherits ::kerberos::params{
  package { '$package_name_kdc':
    ensure => installed,
  }
  package { '$package_name_admin':
    ensure => installed,
    require => Package['$package_name_kdc']
  }
  package { '$package_name_client':
    ensure => installed,
    require => Package['$package_name_admin']
  }
}
