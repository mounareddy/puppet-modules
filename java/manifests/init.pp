class java inherits java::params {

	file { "${java::params::java_base}":
                ensure => 'directory',
                mode => '0644',
                owner => 'root',
                group => 'root',
        }
        file { "${java::params::java_base}/jdk${java::params::java_version}.tar.gz":
                mode => '0644',
                owner => 'root',
                group => 'root',
                source => "puppet:///modules/java/jdk${java::params::java_version}.tar.gz",
                require => File[$::java::params::java_base],
                before => Exec["untar-jdk${java::params::java_version}.tar.gz"],

        }
        exec { "untar-jdk${java::params::java_version}.tar.gz":
                command => "/bin/tar -xzvf jdk${java::params::java_version}.tar.gz",
                cwd     => "${java::params::java_base}",
                creates => "${java::params::java_base}/jdk${java::params::java_version}",
                refreshonly => true,
                subscribe => File["${java::params::java_base}/jdk${java::params::java_version}.tar.gz"],
                before => File["${java::params::java_base}/jdk${java::params::java_version}"],
        }
        file { "${java::params::java_base}/jdk${java::params::java_version}":
                ensure => 'directory',
                mode => '0644',
                owner => 'root',
                group => 'root',
                require => Exec["untar-jdk${java::params::java_version}.tar.gz"],
        }
        file { "/etc/profile.d/java_home.sh":
                ensure => present,
                content => template("java/java_home.sh.erb"),
                mode => '0755',
                owner => root,
                group => root,
                require => File["${java::params::java_base}/jdk${java::params::java_version}"],
        }

}
