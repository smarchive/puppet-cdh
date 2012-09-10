# == Class: cdh::pig::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::pig::params {
  $package = $::cdh_pig_package ? {
    undef   => 'pig',
    default => $::cdh_pig_package,
  }

  $version = $::cdh_pig_version ? {
    undef   => 'installed',
    default => $::cdh_pig_version,
  }
}
