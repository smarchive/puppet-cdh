class cdh::config (
  $config_directory,
  $namenode,
  $hadoop_disks,
  $ganglia_address,
  $log4j_config_source
) {
  # Dependencies
  Class['cdh::base'] -> Class['cdh::config']

  file { "${config_directory}/core-site.xml":
    ensure  => present,
    content => template('cdh/base/core-site.xml.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { "${config_directory}/hadoop-metrics.properties":
    ensure  => present,
    content => template('cdh/base/hadoop-metrics.properties.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { "${config_directory}/log4j.properties":
    ensure  => present,
    source  => $log4j_config_source,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }
}
