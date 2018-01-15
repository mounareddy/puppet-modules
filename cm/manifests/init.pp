class cm(
 ) inherits ::cm::params {
    class {'::cm::repo': }
    -> class {'::cm::req':}
    -> class {'::cm::java':}
    -> class {'::cm::server':}
    -> class {'::cm::agent':}
    -> class {'::cm::install_kerberos':}
    -> class {'::cm::cluster_template':}
    -> class {'::cm::cm_api':}
    -> class {'::cm::management_services':}
    -> class {'::cm::setup_kerberos':}
}
