# == Class: cdh::hbase::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::hbase::params {
  $base_package = $::cdh_hbase_package ? {
    undef   => 'hbase',
    default => $::cdh_hbase_package
  }

  $version = $::cdh_hbase_version ? {
    undef   => 'installed',
    default => $::cdh_hbase_version
  }

  $config_directory = $::cdh_hbase_config_directory ? {
    undef   => '/etc/hbase/conf',
    default => $::cdh_hbase_config_directory
  }

  $rootdir = $::cdh_hbase_rootdir ? {
    undef   => 'hbase',
    default => $::cdh_hbase_rootdir
  }

  $heapsize = $::cdh_hbase_heapsize ? {
    undef   => '1000',
    default => $::cdh_hbase_heapsize
  }

  $block_cache_size = $::cdh_hbase_block_cache_size ? {
    undef   => '0.25',
    default => $::cdh_hbase_block_cache_size
  }

  $master_package = $::cdh_hbase_master_package ? {
    undef   => 'hbase-master',
    default => $::cdh_hbase_master_package
  }

  $master_service = $::cdh_hbase_master_service ? {
    undef   => 'hbase-master',
    default => $::cdh_hbase_master_service
  }

  $regionserver_package = $::cdh_hbase_regionserver_package ? {
    undef   => 'hbase-regionserver',
    default => $::cdh_hbase_regionserver_package
  }

  $regionserver_service = $::cdh_hbase_regionserver_service ? {
    undef   => 'hbase-regionserver',
    default => $::cdh_hbase_regionserver_service
  }

  $thrift_package = $::cdh_hbase_thrift_package ? {
    undef   => 'hbase-thrift',
    default => $::cdh_hbase_thrift_package
  }

  $thrift_service = $::cdh_hbase_thrift_service ? {
    undef   => 'hbase-thrift',
    default => $::cdh_hbase_thrift_service
  }
}
