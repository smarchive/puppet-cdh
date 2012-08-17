class cdh::httpfs::params {
    $httpfs_package = $::cdh_httpfs_package ? {
        undef   => 'hadoop-httpfs',
        default => $::cdh_httpfs_package,
    }

    $httpfs_version = $::cdh_httpfs_version ? {
        undef   => 'installed',
        default => $::cdh_httpfs_version,
    }
}
