### This class will install all the requires packages needed fro the mysql
### Download, extract and install the mysql-community-server along with the mysql-connector-java driver
# requires puppet module install maestrodev-wget --version 1.7.3

class mysqldb::install {

  wget::fetch { 'mysql-server':
    source  => "https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm",
    destination => '/root/',
    user    => 'root',
    mode    => '0644',
    before  => Exec['rpm-mysql-community-server'],
  }
  exec { 'rpm-mysql-community-server':
    command  => 'rpm -ivh mysql57-community-release-el7-11.noarch.rpm',
    cwd      => '/root/',
    unless   => 'yum repolist all | grep mysql',
    path     => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    require  => Wget::Fetch['mysql-server'],
  }
  exec { 'installing-mysql-server':
    command => '/bin/yum -y install mysql-community-server',
    require => Exec['rpm-mysql-community-server'],
    before  => Wget::Fetch['mysql-connector-java'],
  }
  #Download MySQL JDBC driver

  wget::fetch { 'mysql-connector-java':
    source   => "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.44.tar.gz",
    destination => '/root/',
    user     => 'root',
    mode     => '0644',
    before   => Exec['install-mysql-connector'],
    require  => Exec['installing-mysql-server'],
  }
  exec {'install-mysql-connector':
    command     => 'tar zxf mysql-connector-java-5.1.44.tar.gz && mkdir /usr/share/java/ &&  cp mysql-connector-java-5.1.44/mysql-connector-java-5.1.44-bin.jar /usr/share/java/mysql-connector-java.jar',
    cwd         => '/root/',
    unless	=> 'test -f /usr/share/java/mysql-connector-java.jar',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    require     => Wget::Fetch['mysql-connector-java'],
  }
}
