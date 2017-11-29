class kerberos::service inherits ::kerberos::params{
  service { $service_name_kdc:
    ensure => running,
    enable => true
    hasrestart => true,
    hasstatus  => true,
    require => Class['::kerberos::install']
  }
  service { $service_name_admin:
    ensure => running,
    enable => true
    hasrestart => true,
    hasstatus  => true,
    require => Service['$service_name_kdc'],
    notify => Exec[]
  }
}
