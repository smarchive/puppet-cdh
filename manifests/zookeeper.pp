class cdh::zookeeper(
  $id                  = $cdh::zookeeper::params::id,
  $package             = $cdh::zookeeper::params::package,
  $version             = $cdh::zookeeper::params::version,
  $config_directory    = $cdh::zookeeper::params::config_directory,
  $tick_time           = $cdh::zookeeper::params::tick_time,
  $init_limit          = $cdh::zookeeper::params::init_limit,
  $sync_limit          = $cdh::zookeeper::params::sync_limit,
  $data_dir            = $cdh::zookeeper::params::data_dir,
  $client_port         = $cdh::zookeeper::params::client_port,
  $log4j_config_source = $cdh::zookeeper::params::log4j_config_source,
  $config_xsl_source   = $cdh::zookeeper::params::config_xsl_source,
) inherits cdh::zookeeper::params {

  File {
    owner   => 'root',
    group   => 'zookeeper',
    mode    => '0640',
  }

  package { $package:
    ensure => $version,
    notify => [
        Exec['zookeeper-init'],
        Exec['zookeeper-alternatives'],
      ],
  }

  file { $config_directory:
    ensure  => directory,
    purge   => true,
    require => Package[$package],
  }

  exec { 'zookeeper-init':
    command     => "/etc/init.d/zookeeper-server init --myid=${id}",
    refreshonly => true,
  }

  class { 'cdh::zookeeper::config':
    config_directory    => $config_directory,
    tick_time           => $tick_time,
    init_limit          => $init_limit,
    sync_limit          => $sync_limit,
    data_dir            => $data_dir,
    client_port         => $client_port,
    log4j_config_source => $log4j_config_source,
    config_xsl_source   => $config_xsl_source,
    require             => File[$config_directory],
  }

  service { 'zookeeper-server':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
    subscribe  => Class['cdh::zookeeper::config'],
  }

  $alternatives_command = $::osfamily ? {
    'Debian' => "/usr/sbin/update-alternatives --install /etc/zookeeper/conf zookeeper-conf ${config_directory} 50",
    'RedHat' => "/usr/sbin/alternatives --install /etc/zookeeper/conf zookeeper-conf ${config_directory} 50",
  }

  exec { 'zookeeper-alternatives':
    command     => $alternatives_command,
    refreshonly => true,
    require     => File[$config_directory],
  }
}
