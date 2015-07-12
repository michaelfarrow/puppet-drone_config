class drone_config (
	$config_content = ''
) {

	file { "/etc/drone/drone.toml":
		ensure => present,
		content => $config_content
	}

}
