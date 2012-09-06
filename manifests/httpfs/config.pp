class cdh::httpfs::config(
  $buffer_size         = $cdh::httpfs::params::buffer_size,
  $secret              = $cdh::httpfs::params::secret,
  $log4j_config_source = $cdh::httpfs::params::log4j_config_source,
) {

  file { "${config_directory}/httpfs-signature.secret":
    ensure  => present,
    content => $secret,
  }

  file { "${config_directory}/httpfs-log4j.properties":
    ensure  => present,
    source  => $log4j_config_source,
  }

  file { "${config_directory}/httpfs-site.xml":
    ensure  => present,
    content => template('cdh/httpfs/httpfs-site.xml.erb'),
  }
}
