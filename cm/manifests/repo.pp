# == Class: scm::repo
#
# This class install repositories required for cloudera manager
# === Requires:
#
# puppetlabs-apt

class cm::repo {
  $reposerver = $cm::params::reposerver,

  file { '/etc/yum.repo.d/clouders-manager.repo':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode => '0644',
  }
  case $::operatingsystem {
  'CentOS', 'RedHat':
  yumrepo { 'cloudera-manager':
        descr          => 'Cloudera Manager',
        enabled        => 1,
        gpgcheck       => 1,
        gpgkey         => "${cm_reposerver}${scm::params::cm_gpgkey}",
        baseurl        => "${cm_reposerver}${scm::params::cm_yumpath}",
      }
  'Ubuntu':{
    # Packages for Cloudera Manager, Version 5, on Ubuntu 14.04 x86_64
    #deb [arch=amd64] http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm trusty-cm5 contrib
    #deb-src http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm trusty-cm5 contrib
    include apt
      apt::source { 'cloudera-manager':
        location    => "[arch=${::architecture}] ${cm_reposerver}${cm::params::cm_aptpath}" ,
        #location   => [arch=amd64] http://archive.cloudera.com/cm5/ubuntu/trusty/amd64/cm
        release     => "${scm::params::cm_aptrelease}",
        #release    => trusty-cm5
        repos       => "${scm::params::cm_aptrepos}",
        #repos      => contrib
        include     => { 'src' => True }
        notify      => Exec["apt-update"]
      }

    }
  }
}
