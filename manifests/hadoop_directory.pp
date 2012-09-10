# == Define: cdh::hadoop_directory
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
define cdh::hadoop_directory() {
  file { "${name}/hadoop":
    ensure => directory,
    owner  => 'root',
    group  => 'hadoop',
  }
}

