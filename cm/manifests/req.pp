class cm::req {
  exec { 'install the wget with puppet ':
    command => 'puppet module install maestrodev-wget --version 1.7.3',
    path => '/opt/puppetlabs/bin/:/bin/:/usr/bin',
    unless => 'ls -l /etc/puppetlabs/code/environments/production/modules | grep wget    ',
    # refreshonly => true,
  }
  exec { 'install vim, wget':
    command => 'yum -y install vim && yum -y install wget',
    path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    #unless => 'rpm -qa | grep wget'
    # refreshonly => true,
  }
}
