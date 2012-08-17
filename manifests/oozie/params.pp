class cdh::oozie::params {
    $oozie_package = $::cdh_oozie_package ? {
        undef   => 'oozie',
        default => $::cdh_oozie_package,
    }

    $oozie_version = $::cdh_oozie_version ? {
        undef   => 'installed',
        default => $::cdh_oozie_version,
    }

    $oozie_client_package = $::cdh_oozie_client_package ? {
        undef   => 'oozie-client',
        default => $::cdh_oozie_client_package,
    }

    $oozie_client_version = $::cdh_oozie_client_version ? {
        undef   => 'installed',
        default => $::cdh_oozie_client_version,
    }
}
