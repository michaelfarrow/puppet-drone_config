class drone_config (
	$config_content = ''
) {

	Class ['docker'] ~> Class ['drone']

	service { "drone":
		ensure => running,
		require => Package ['drone']
	}

	file { "/etc/drone/drone.toml":
		ensure => present,
		content => $config_content,
		require => Package ['drone'],
		notify => Service ['drone']
	}

}
