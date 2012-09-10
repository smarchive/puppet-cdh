# == Define: cdh::hadoop_dfs_directory
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
define cdh::hadoop_dfs_directory() {
  file { "${name}/hadoop/dfs":
    ensure => directory,
    owner  => 'hdfs',
    group  => 'hadoop',
  }
}

