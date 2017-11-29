class utils::database inherits utils::params {

    class { 'postgresql::globals':
        manage_package_repo => true,
        version             => '9.4',
    }

    class { 'postgresql::server' :
        listen_addresses => '*',
        postgres_password => 'postgres123',
        pg_hba_conf_defaults => false,
    }

    class { 'postgresql::lib::devel': }

    postgresql::server::pg_hba_rule { 'allow local connections for postgres':
        description => "Open up postgresql local using ident",
        type => 'local',
        database => 'all',
        user => 'all',
        auth_method => 'peer',
        order => 01
    }
    #
    # postgresql::server::pg_hba_rule { 'allow local connections':
    #     description => "Open up postgresql local using password",
    #     type => 'local',
    #     database => 'all',
    #     user => 'all',
    #      auth_method => 'md5',
    #      order => 02
    #  }

     postgresql::server::pg_hba_rule { 'ipv4 local connectios':
         description => "Open up postgresql local using password",
         type => 'host',
         database => 'all',
         user => 'all',
         address => '127.0.0.1/32',
         auth_method => 'md5',
         order => 03
     }

     postgresql::server::pg_hba_rule { 'ipv6 local connections':
         description => "Open up postgresql local using password",
         type => 'host',
         database => 'all',
         user => 'all',
         address => '::1/128',
         auth_method => 'md5',
        order => 04
    }

    postgresql::server::db { $::utils::params::ambari_database:
        user     => $::utils::params::ambari_username,
        password => $::utils::params::ambari_password
    }

    postgresql::server::database_grant { $::utils::params::ambari_database:
        privilege => 'ALL',
        db        => $::utils::params::ambari_database,
        role      => $::utils::params::ambari_username,
    }

    postgresql::server::role { $::utils::params::ambari_username:
        password_hash => postgresql_password($::utils::params::ambari_username, $::utils::params::ambari_password),
    }

    postgresql::server::pg_hba_rule { "allow ${::utils::params::ambari_username} user":
        description => "Open up postgresql for access to ${::utils::params::ambari_database} database",
        type        => 'host',
        database    => $::utils::params::ambari_database,
        user        => $::utils::params::ambari_username,
        address     => '0.0.0.0/0',
        auth_method => 'md5'
    }

    postgresql::server::db { $::utils::params::hive_database:
      user     => $::utils::params::hive_username,
      password => $::utils::params::hive_password,
    }

    postgresql::server::pg_hba_rule { "allow ${::utils::params::hive_username} user":
      description => "Open up postgresql for access to ${::utils::params::hive_database} database",
      type        => 'host',
      database    => $::utils::params::hive_database,
      user        => $::utils::params::hive_username,
      address     => '0.0.0.0/0',
      auth_method => 'md5'
    }

    postgresql::server::db { $::utils::params::oozie_database:
      user     => $::utils::params::oozie_username,
      password => $::utils::params::oozie_password
    }

    postgresql::server::pg_hba_rule { "allow ${::utils::params::oozie_username} user":
      description => "Open up postgresql for access to ${::utils::params::oozie_database} database",
      type        => 'host',
      database    => $::utils::params::oozie_database,
      user        => $::utils::params::oozie_username,
      address     => '0.0.0.0/0',
      auth_method => 'trust'
    }
#yum install postgresql-jdbc not working
    package { "postgresql-jdbc":
        ensure => present
    }

    file { "/usr/share/java/postgresql-jdbc.jar":
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        require => Package["postgresql-jdbc"],
    }

    postgresql::server::schema { "create ambari schema":
        db      => $::utils::params::ambari_database,
        schema  => $::utils::params::ambari_schema,
        owner   => $::utils::params::ambari_username,
        require => Postgresql::Server::Db[$::utils::params::ambari_database]
    }
    file {"/tmp/Ambari-DDL-Postgres-CREATE.sql":
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => '0755',
        source => "puppet:///modules/utils/Ambari-DDL-Postgres-CREATE.sql",
        require => Postgresql::Server::Schema["create ambari schema"],
        before => Exec['postgres_create_schema'],
        }
    exec { 'postgres_create_schema':
        command => "bash -c \"PGPASSWORD=$::utils::params::ambari_password psql -U $::utils::params::ambari_username -d $::utils::params::ambari_database -h $::fqdn -f /tmp/Ambari-DDL-Postgres-CREATE.sql\"",
        path    => '/usr/pgsql-9.4/bin:/usr/bin:/bin',
        environment => [ "PGPASSWORD=$::utils::params::ambari_password" ],
        user    => 'root',
        require => File['/tmp/Ambari-DDL-Postgres-CREATE.sql'],
    }
}
