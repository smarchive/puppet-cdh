class cdh::sqoop::params {
    $sqoop_package = $::cdh_sqoop_package ? {
        undef   => 'sqoop',
        default => $::cdh_sqoop_package,
    }

    $sqoop_version = $::cdh_sqoop_version ? {
        undef   => 'installed',
        default => $::cdh_sqoop_version,
    }
}
