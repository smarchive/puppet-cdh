# == Class: cdh::pig
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::pig(
  $package = $cdh::pig::params::package,
  $version = $cdh::pig::params::version,
) inherits cdh::pig::params {

  package { $package:
    ensure => $version,
  }
}
