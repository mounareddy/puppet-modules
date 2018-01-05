class cm::install_kerberos(
  $kdc_hostname= $cm::params::kdc_hostname,
  $realm_caps= $cm::params::realm_caps,
  $realm_in_small = $cm::params::realm_in_small,

 ) {
  # require java
  file { '/usr/java/jdk1.8.0_151/jre/lib/security/jce_policy-8.zip':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/cm/jce_policy-8.zip",
    before => Exec['AES-256 encryption for Kerberos tickets']
  }
  Exec { 'AES-256 encryption for Kerberos tickets':
    command => 'yum -y install unzip && unzip jce_policy-8.zip',
    unless => 'ls /usr/java/jdk1.8.0_151/jre/lib/security/UnlimitedJCEPolicyJDK8',
    path => '/bin',
    cwd => '/usr/java/jdk1.8.0_151/jre/lib/security/',
    require => File['/usr/java/jdk1.8.0_151/jre/lib/security/jce_policy-8.zip'],
  }
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"]
  }

  package { ['krb5-server', 'krb5-libs', 'krb5-workstation']:
    ensure  => present,
  }

  #exec { 'install_rng':
  #  command => 'yum -y install rng-tools',
  #}
  file { "/etc/krb5.conf":
    owner => root,
    group => root,
    mode => "755",
    replace => true,
    content => template('cm/krb5.conf.erb'),
    require => Package[['krb5-server', 'krb5-libs', 'krb5-workstation']],
  }

  file { "/var/kerberos/krb5kdc/kdc.conf":
    owner => root,
    group => root,
    mode => "755",
    replace => true,
    content => template('cm/kdc.conf.erb'),
    require => File["/etc/krb5.conf"],
  }

  file { "/var/kerberos/krb5kdc/kadm5.acl":
    owner => root,
    group => root,
    mode => "755",
    replace => true,
    content => template('cm/kadm5.acl.erb'),
    require => File["/var/kerberos/krb5kdc/kdc.conf"],
  }

  #service {"rngd": # "start_rng":
  #  ensure => "running",
    #command => "/etc/init.d/rngd start",
  #  require => Exec['install_rng'],
  #}

  exec {"create_kdb5":
    command => "kdb5_util create -s -P hadoop123",
    creates => "/var/kerberos/krb5kdc/principal",
    require => File['/var/kerberos/krb5kdc/kadm5.acl']
  }

  exec {"create_krb5_adm":
    command => 'kadmin.local -q "addprinc -pw cloudera123 cloudera-scm/admin"',
    require => Exec["create_kdb5"],
  }

  service {"kadmin":
    ensure => "running",
    require => Exec["create_krb5_adm"],
  }

  service {"krb5kdc":
    ensure => "running",
    require => Exec["create_krb5_adm"],
  }

  #exec {"stop_rng":
  #  command => "/etc/init.d/rngd stop",
  #  require => Exec["create_krb5_adm"],
  #}
}
