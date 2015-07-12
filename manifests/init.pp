class drone_config (
	$config_content = ''
) {

	service { "droned":
		ensure => running,
		require => Package ['drone']
	}

	file { "/etc/drone/drone.toml":
		ensure => present,
		content => $config_content,
		require => Package ['drone'],
		notify => Service ['droned']
	}

}
