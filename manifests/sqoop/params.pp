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
