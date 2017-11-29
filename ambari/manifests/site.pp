node 'ambariserver.cdl.local'{
  $ambari-server = '54.146.25.39'
  $master1= '54.146.25.39'
  $master2 = '52.71.185.152'
  $edgeserver = '54.204.93.113'
  $datanode= ['52.207.195.34','54.208.182.51']
  $datanode_withzk = '34.230.78.111'
  $servercount = 6
  include java
  include utils::dbpostgres
  include ambari::agent
  include ambari::server
  include ambari::blueprint
  include ambari::clusterconfig
}
node 'master2.cdl.local','worker2.cdl.local','worker1.cdl.local','worker3.cdl.local','edgenode.cdl.local' {
  $ambari-server = '54.146.25.39'
  $master1= '54.146.25.39'
  $master2 = '52.71.185.152'
  $edgeserver = '54.204.93.113'
  $datanode= ['52.207.195.34','54.208.182.51']
  $datanode_withzk = '34.230.78.111'
  include java
  include ambari::agent
}
