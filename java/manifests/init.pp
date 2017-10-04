class java{

      require java::params 
      
	file { "${java::params::java_base}":
                ensure => 'directory',
                mode => '0644',
                owner => 'root',
                group => 'root',
                alias => "base-dir",
        }
        file { "${java::params::java_base}/jdk${java::params::java_version}.tar.gz":
                mode => '0644',
                owner => 'root',
                group => 'root',
                source => "puppet:///modules/java/jdk${java::params::java_version}.tar.gz",
                alias => "tar-file",
                require => File["base-dir"],
                before => Exec["extract-tar"],

        }
        exec { "untar jdk${java::params::java_version}.tar.gz":
                command => "/bin/tar -xzvf jdk${java::params::java_version}.tar.gz",
                cwd     => "${java::params::java_base}",
                creates => "${java::params::java_base}/jdk${java::params::java_version}",
                alias => "extract-tar",
                refreshonly => true,
                subscribe => File["tar-file"],
                before => File["java-dir"],
        }
        file { "${java::params::java_base}/jdk${java::params::java_version}":
                ensure => 'directory',
                mode => '0644',
                owner => 'root',
                group => 'root',
                alias => "java-dir",
                require => Exec["extract-tar"],
        }
        file { "/etc/profile.d/java_home.sh":
                ensure => present,
                content => template("java/java_home.sh.erb"),
                mode => '0755',
                owner => root,
                group => root,
                require => File["java-dir"],
        }
}
