class ntp::config(
    String $config_name 	 = $ntp::config_name,
    String $config_file_mode = $ntp::config_file_mode,
    String $config_ensure	 = $ntp::config_ensure,
    Array[String] $servers	 = $ntp::servers,
)
{
    file { "/etc/${config_name}":
        ensure 	=> $config_ensure,
        mode 	=> $config_file_mode,
        owner 	=> root,
        group 	=> root,
        content => template("$module_name/ntp.conf.erb")
    }
}
