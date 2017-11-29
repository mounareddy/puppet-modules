class kerberos::config {

  file { '/etc/krb5.conf':
    ensure => file,
    ensure => present,
    owner  => 'root',
    group => 'root',
    mode => '0644',
    content => template('kerberos/krb5.conf.erb')
    require => Class[::kerberos::install]
  }
  file { '/var/kerberos/krb5kdc/kadm5.acl':
    ensure => file,
    ensure => present,
    owner => 'root',
    group => 'root'
    mode => '0644',
    content => template('kerberos/kadm5.acl.erb'),
    require => File['/etc/krb5.conf'],
  }
  file { '/var/kerberos/krb5kdc/kdc.conf':
    ensure => file,
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('kerberos/kdc.conf.erb'),
    require => File['/etc/krb5.conf'],
  }

}
