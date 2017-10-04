class ntp(
	String $package_name 		= $ntp::params::package_name,
	String $package_ensure		=  $ntp::params::package_ensure,
	String $config_name		= $ntp::params::config_name,
	String $config_file_mode	= $ntp::params::config_file_mode,
	Array[String] $servers		= $ntp::params::servers,
	String $service_name		= $ntp::params::service_name,
	String $service_ensure		= $ntp::params::service_ensure,
	Boolean $service_enable		= $ntp::params::service_enable,
	Boolean $service_hasstatus	= $ntp::params::service_hasstatus,
	Boolean $service_hasrestart	= $ntp::params::service_hasrestart,
) inherits ::ntp::params
{
	class {'::ntp::install': }
	-> class {'::ntp::config': }
	-> class {'::ntp::service': }
}
