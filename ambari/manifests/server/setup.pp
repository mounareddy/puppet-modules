class ambari::server::setup (
    $default_install   = true,
    $db_backened       = undef,
    $db_host           = undef,
    $db_port           = undef,
    $db_username       = undef,
    $db_password       = undef,
){
    $cmd = $default_install ? {
        true => 'ambari-server setup -s',
        false => 'NOT_IMPLEMENTED'
    }
    if $cmd == 'NOT_IMPLEMENTED' {
        fail('only :default_install => true is supported')
    }
<<<<<<< HEAD
# run the setup with  ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar
=======

>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
    exec { 'run ambari-server setup':
        command => "${cmd} && touch /etc/ambari-server/conf/installed",
        path    => '/bin:/sbin:/usr/bin:/usr/sbin',
        creates => '/etc/amabri-server/conf/installed'
    }
<<<<<<< HEAD
    exec {'run ambari-server setup --jdbc-db=postgres ':
      command => "ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar"
      path => 

   }
=======
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
}
