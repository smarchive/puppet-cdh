class cdh::zookeeper::params {
    $zookeeper_package = $::cdh_zookeeper_package ? {
        undef   => 'zookeeper',
        default => $::cdh_zookeeper_package,
    }

    $zookeeper_version = $::cdh_zookeeper_version ? {
        undef   => 'installed',
        default => $::cdh_zookeeper_version,
    }

    $zookeeper_server_package = $::cdh_zookeeper_server_package ? {
        undef   => 'zookeeper-server',
        default => $::cdh_zookeeper_server_package,
    }

    $zookeeper_server_version = $::cdh_zookeeper_server_version ? {
        undef   => 'installed',
        default => $::cdh_zookeeper_server_version,
    }
}
