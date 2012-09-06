class cdh::httpfs(
  $package             = $cdh::httpfs::params::package,
  $version             = $cdh::httpfs::params::version,
  $config_directory    = $cdh::httpfs::params::config_directory,
  $buffer_size         = $cdh::httpfs::params::buffer_size,
  $secret              = $cdh::httpfs::params::secret,
  $log4j_config_source = $cdh::httpfs::params::log4j_config_source,
) inherits cdh::httpfs::params {

  File {
    owner => 'root',
    group => 'httpfs',
    mode  => '0640',
  }

  package { $package:
    ensure => $version,
    notify => Exec['hadoop-httpfs-alternatives'],
  }

  file { $config_directory:
    ensure  => directory,
    purge   => true,
    require => Package[$package]
  }

  class { 'cdh::httpfs::config':
    buffer_size         => $buffer_size,
    secret              => $secret,
    log4j_config_source => $log4j_config_source,
    require             => Package[$package],
  }

  service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
    subscribe  => Class['cdh::httpfs::config'],
  }

  $alternatives_command = $::osfamily ? {
    'Debian' => "/usr/sbin/update-alternatives --install /etc/hadoop-httpfs/conf hadoop-httpfs-conf ${config_directory} 50",
    'RedHat' => "/usr/sbin/alternatives --install /etc/hadoop-httpfs/conf hadoop-httpfs-conf ${config_directory} 50",
  }

  exec { 'hadoop-httpfs-alternatives':
    command     => $alternatives_command,
    refreshonly => true,
    require     => File[$config_directory],
  }
}
