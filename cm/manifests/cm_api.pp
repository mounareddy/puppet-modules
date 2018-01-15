#installing the pip and cm_api
class cm::cm_api{
    exec { 'Add/Install the epel repo':
      command => 'rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm',
      path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      before => Exec['Installing the pip'],
      unless => 'rpm -qa | grep epel-release',
      # refreshonly => true,
    }
    exec { 'Installing the pip':
      command => 'yum -y install python2-pip',
      path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      require => Exec['Add/Install the epel repo'],
      unless => 'rpm -qa | grep python2-pip',
      # refreshonly => true,
    }
    #install the Python API client
    exec { 'Install the Python API client':
      command => 'pip install cm-api',
      path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      require => Exec['Installing the pip'],
      # refreshonly => true,
    }
}
