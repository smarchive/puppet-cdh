# == Class: cdh::sqoop
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::sqoop(
  $package             = $cdh::sqoop::params::package,
  $version             = $cdh::sqoop::params::version,
) inherits cdh::sqoop::params {

  package { $package:
    ensure => $version,
  }
}
