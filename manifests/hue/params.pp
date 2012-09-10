# == Class: cdh::hue::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::hue::params {
    $hue_package = $::cdh_hue_package ? {
        undef   => 'hue',
        default => $::cdh_hue_package,
    }

    $hue_version = $::cdh_hue_version ? {
        undef   => 'installed',
        default => $::cdh_hue_version,
    }

    $hue_server_package = $::cdh_hue_server_package ? {
        undef   => 'hue-server',
        default => $::cdh_hue_server_package,
    }

    $hue_server_version = $::cdh_hue_server_version ? {
        undef   => 'installed',
        default => $::cdh_hue_server_version,
    }

    $hue_plugins_package = $::cdh_hue_plugins_package ? {
        undef   => 'hue-plugins',
        default => $::cdh_hue_package,
    }

    $hue_plugins_version = $::cdh_hue_plugins_version ? {
        undef   => 'installed',
        default => $::cdh_hue_plugins_version,
    }
}
