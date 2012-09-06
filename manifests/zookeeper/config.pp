class cdh::zookeeper::config(
  $config_directory,
  $servers,
  $tick_time,
  $init_limit,
  $sync_limit,
  $data_dir,
  $client_port,
  $log4j_config_source,
  $config_xsl_source,
) {

  file { "${config_directory}/zoo.cfg":
    ensure  => present,
    content => template('cdh/zookeeper/zoo.cfg.erb'),
  }

  file { "${config_directory}/log4j.properties":
    ensure  => present,
    source  => $log4j_config_source,
  }

  file { "${config_directory}/configuration.xsl":
    ensure  => present,
    source  => $config_xsl_source,
  }
}
