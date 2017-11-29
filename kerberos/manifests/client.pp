class kerberos::client {
  package {'$package_name_client':
    ensure => installed,
  }
}
