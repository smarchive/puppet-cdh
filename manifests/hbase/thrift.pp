# == Class: cdh::hbase::thrift
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::hbase::thrift (
  $package = $cdh::hbase::params::thrift_package,
  $version = $cdh::hbase::params::version,
  $service = $cdh::hbase::params::thrift_service
) inherits cdh::hbase::params {
  # Dependencies
  Class['cdh::hbase']         -> Class['cdh::hbase::thrift']
  Class['cdh::hbase::config'] -> Class['cdh::hbase::thrift']

  package { $package:
    ensure => $version,
  }

  service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
    subscribe  => Class['cdh::hbase::config'],
  }
}
