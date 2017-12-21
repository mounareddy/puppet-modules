#This class adds the spark2 jar file to the cloudera manager host
# Once the cloudera-manager is installled add the spark parcels to the cloudera manager parcels configuration tab
#
# add this to parcels  'http://archive.cloudera.com/spark2/parcels/2.2.0.cloudera1/'
#
# reference https://www.cloudera.com/documentation/spark2/latest/topics/spark2_installing.html
#
#
class cm::add_spark {
  file {'/opt/cloudera/csd/SPARK2_ON_YARN-2.2.0.cloudera1.jira':
    ensure => 'present',
    owner  => 'cloudera-scm',
    group  => 'cloudera-scm',
    mode   => '0644',
    source => "puppet:///modules/cm/SPARK2_ON_YARN-2.2.0.cloudera1.jira",
    notify => Service['cloudera-scm-server'],
  }
  service {'cloudera-scm-server':
      ensure => running,
      enable => true,
      require => File['/opt/cloudera/csd/SPARK2_ON_YARN-2.2.0.cloudera1.jira'],
  }
}
