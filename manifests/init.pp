# == Class: cdh
#
# Install CDH 4.0 from Cloudera
#
# === Parameters
#
# [*namenode*]
#   Address of the Hadoop cluster's name node
#
# [*hadoop_disks*]
#   Array of directories in which data is stored
#
# [*ganglia_address*]
#   Address of the Ganglia server
#
# [*java_class*]
#   Reference to the resource installing the Java runtime
#
# [*repo_name*]
#   Name of the package source
#
# [*repo_baseurl*]
#   URL of the package source
#
# [*repo_release*]
#   Release name of the package source
#
# [*repo_repos*]
#   Repositories to include from the package source
#
# [*repo_pin*]
#   Pin priority of the package source
#
# [*repo_key*]
#   GnuPG key to use for the package source
#
# [*repo_key_source*]
#   URL of the GnuPG key of the package source
#
# [*repo_gpgcheck*]
#   Whether to check the GnuPG key of the package source
#
# [*repo_enabled*]
#   Whether to enable the package source
#
# [*hadoop_package*]
#   Name of the Hadoop package install
#
# [*hadoop_version*]
#   Version of the Hadoop package to install
#
# [*config_directory*]
#   Configuration directory
#
# [*log4j_config_source*]
#   (File) source of the Log4j configuration
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
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
  $log4j_config_source   = $cdh::params::log4j_config_source,
) inherits cdh::params {
  if $java_class != 'DISABLED' {
    Class[$java_class] -> Class['cdh']
  }

  validate_array($hadoop_disks)

  class { 'cdh::repo':
    repo_name  => $repo_name,
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
    config_directory    => $config_directory,
    namenode            => $namenode,
    hadoop_disks        => $hadoop_disks,
    ganglia_address     => $ganglia_address,
    log4j_config_source => $log4j_config_source,
  }
}
