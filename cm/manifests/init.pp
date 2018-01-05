class cm(
 ) inherits ::cm::params {
    class {'::cm::repo': }
    -> class {'::cm::server':}
    -> class {'::cm::agent':}
    -> class {'::cm::install_kerberos':}
    -> class {'::cm::cluster_template':}
    -> class {'::cm::management_services'}
    -> class {'::cm::setup_kerberos'}
}
