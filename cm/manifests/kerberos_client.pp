class cm::kerberos_client{
  package { [ 'krb5-libs', 'krb5-workstation']:
    ensure  => present,
  }
}
