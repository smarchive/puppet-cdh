# == Class: cdh::sqoop::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::sqoop::params {
    $package = $::cdh_sqoop_package ? {
        undef   => 'sqoop',
        default => $::cdh_sqoop_package,
    }

    $version = $::cdh_sqoop_version ? {
        undef   => 'installed',
        default => $::cdh_sqoop_version,
    }
}
