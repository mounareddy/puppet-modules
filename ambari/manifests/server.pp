class ambari::server inherits ::ambari::params {
    include java
    include ambari::server::install
    include ambari::server::config
    include ambari::server::service
    include ambari::server::setup
    include ambari::blueprint

    Class['java']
    -> Class['::ambari::server::install']
    -> Class['::ambari::server::config']
    -> Class['::ambari::server::service']
    -> Class['::ambari::server::setup']
    -> Class['::ambari::blueprint']
    -> Class['::ambari::clusterconfig']
}
