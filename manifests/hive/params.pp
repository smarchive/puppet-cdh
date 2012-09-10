# == Class: cdh::hive::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::hive::params {
    $hive_package = $::cdh_hive_package ? {
        undef   => 'hive',
        default => $::cdh_hive_package,
    }

    $hive_version = $::cdh_hive_version ? {
        undef   => 'installed',
        default => $::cdh_hive_version,
    }
}
