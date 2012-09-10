# == Define: cdh::hadoop_mapreduce_directory
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
define cdh::hadoop_mapreduce_directory() {
  file { "${name}/hadoop/mapreduce":
    ensure => directory,
    owner  => 'mapred',
    group  => 'hadoop',
  }
}
