class cdh (
  $namenode,
  $hadoop_disks,
  $ganglia_address,
  $java_class            = $cdh::params::java_class,
  $repo_name             = $cdh::params::repo_name,
  $repo_baseurl          = $cdh::params::repo_baseurl,
  $repo_release          = $cdh::params::repo_release,
  $repo_repos            = $cdh::params::repo_repos,
  $repo_pin              = $cdh::params::repo_pin,
  $repo_key              = $cdh::params::repo_key,
  $repo_key_source       = $cdh::params::repo_key_source,
  $repo_gpgcheck         = $cdh::params::repo_gpgcheck,
  $repo_enabled          = $cdh::params::repo_enabled,
  $hadoop_package        = $cdh::params::hadoop_package,
  $hadoop_version        = $cdh::params::hadoop_version,
  $config_directory      = $cdh::params::config_directory,
) inherits cdh::params {
  if $java_class != 'DISABLED' {
    Class[$java_class] -> Class['cdh']
  }

  validate_array($hadoop_disks)

  class { 'cdh::repo':
    name       => $repo_name,
    baseurl    => $repo_baseurl,
    release    => $repo_release,
    repos      => $repo_repos,
    pin        => $repo_pin,
    key        => $repo_key,
    key_source => $repo_key_source,
    gpgcheck   => $repo_gpgcheck,
    enabled    => $repo_enabled,
  }

  class { 'cdh::base':
    package          => $hadoop_package,
    hadoop_version   => $hadoop_version,
    config_directory => $config_directory,
    hadoop_disks     => $hadoop_disks,
  }

  class { 'cdh::config':
    config_directory => $config_directory,
    namenode         => $namenode,
    hadoop_disks     => $hadoop_disks,
    ganglia_address  => $ganglia_address,
  }
}
