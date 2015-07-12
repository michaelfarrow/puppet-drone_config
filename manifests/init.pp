class drone_config (
	$config_content = ""
) {

	Class ["docker"] ~> Class ["drone"]

	cron { "cleanup docker volumes":
		command => "docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes",
		user => root,
		hour => "*",
		minute => 5,
		require => Package ["docker"]
	}

	service { "drone":
		ensure => running,
		require => Package ["drone"]
	}

	file { "/etc/drone/drone.toml":
		ensure => present,
		content => $config_content,
		require => Package ["drone"],
		notify => Service ["drone"]
	}

}
