# == Class: cdh::hdfs::config
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::hdfs::config (
  $config_directory,
  $hadoop_disks,
  $replication
) {
  # Dependencies
  Class['cdh::base'] -> Class['cdh::hdfs::config']

  file { "${config_directory}/hdfs-site.xml":
    ensure  => present,
    content => template('cdh/hdfs/hdfs-site.xml.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
