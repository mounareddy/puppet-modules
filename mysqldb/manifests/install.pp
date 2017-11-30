class mysqldb::install {
#install puppet module install maestrodev-wget --version 1.7.3

#package { 'wget':
#  ensure => installed,
#}

if os::family == 'RedHat' {
  wget::fetch { 'mysql server':
    source  => "https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm",
    user    => 'root',
    mode    => '0644',
    before  => Exec['install  mysql-community-server'],
    }
  }
  exec { 'install  mysql-community-server':
    command  => '/bin/rpm -Uvh mysql57-community-release-el7-11.noarch.rpm',
    cwd      => '/root/',
    path     => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    #require => Wget::fetch['mysql'],
    # refreshonly => true,
  }
  #Download MySQL JDBC driver

  if os::family == 'RedHat' {
    wget::fetch { 'mysql-connector-java.jar':
        source   => "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.44.tar.gz",
        user     => 'root',
        mode     => '0644',
        require  => Exec['install  mysql-community-server'],
        before   => Exec['install mysql connector'],
      }
  }
  exec {'install mysql connector':
    command     => 'tar -xf mysql-connector-java-5.1.44.tar.gz',
    cwd         => '/root/',
    destination => '/usr/share/java/mysql-connector-java.jar',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    #require    => Wget::fetch['mysql-connector-java.jar'],
  }


}
