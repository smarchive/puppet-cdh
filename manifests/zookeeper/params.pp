class cdh::zookeeper::params {
  $package = $::cdh_zookeeper_package ? {
    undef   => 'zookeeper-server',
    default => $::cdh_zookeeper_package,
  }

  $version = $::cdh_zookeeper_version ? {
    undef   => 'installed',
    default => $::cdh_zookeeper_version,
  }

  $id = $::cdh_zookeeper_id ? {
    undef   => 1,
    default => $::cdh_zookeeper_id,
  }

  $config_directory = $::cdh_zookeeper_config_directory ? {
    undef   => '/etc/zookeeper/conf.puppet',
    default => $::cdh_zookeeper_config_directory,
  }

  $max_client_connections = $::cdh_zookeeper_max_client_connections ? {
    undef   => 50,
    default => $::cdh_zookeeper_max_client_connections,
  }

  $tick_time = $::cdh_zookeeper_tick_time ? {
    undef   => 2000,
    default => $::cdh_zookeeper_tick_time,
  }

  $init_limit = $::cdh_zookeeper_init_limit ? {
    undef   => 10,
    default => $::cdh_zookeeper_init_limit,
  }

  $sync_limit = $::cdh_zookeeper_sync_limit ? {
    undef   => 5,
    default => $::cdh_zookeeper_sync_limit,
  }

  $data_dir = $::cdh_zookeeper_data_dir ? {
    undef   => '/var/lib/zookeeper',
    default => $::cdh_zookeeper_data_dir,
  }

  $client_port = $::cdh_zookeeper_client_port ? {
    undef   => 2181,
    default => $::cdh_zookeeper_client_port,
  }

  $log4j_config_source = $::cdh_zookeeper_log4j_config_source ? {
    undef   => "puppet:///modules/${module_name}/zookeeper/log4j.properties",
    default => $::cdh_zookeeper_log4j_config_source,
  }

  $config_xsl_source = $::cdh_zookeeper_config_xsl_source ? {
    undef   => "puppet:///modules/${module_name}/zookeeper/configuration.xsl",
    default => $::cdh_zookeeper_config_xsl_source,
  }
}
