class cm(
 ) inherits ::cm::params {
    class {'::cm::repo': }
    -> class {'::cm::server':}
    -> class {'::cm::agent':}
}
