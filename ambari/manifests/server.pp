class ambari::server inherits ::ambari::params {
    include java
    include ambari::server::install
    include ambari::server::config
    include ambari::server::service
    include ambari::server::setup
<<<<<<< HEAD
    include ambari::blueprint
=======
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f

    Class['java']
    -> Class['::ambari::server::install']
    -> Class['::ambari::server::config']
    -> Class['::ambari::server::service']
    -> Class['::ambari::server::setup']
<<<<<<< HEAD
    -> Class['::ambari::blueprint']
    -> Class['::ambari::clusterconfig']
=======
>>>>>>> 649d7c8e8211fa872a775485514ab269f021388f
}
