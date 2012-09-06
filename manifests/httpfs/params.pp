class cdh::httpfs::params {
    $package = $::cdh_httpfs_package ? {
        undef   => 'hadoop-httpfs',
        default => $::cdh_httpfs_package,
    }

    $version = $::cdh_httpfs_version ? {
        undef   => 'installed',
        default => $::cdh_httpfs_version,
    }

    $service = $::cdh_httpfs_service ? {
        undef   => 'hadoop-httpfs',
        default => $::cdh_httpfs_service,
    }

    $config_directory = $::cdh_httpfs_config_directory ? {
        undef   => '/etc/hadoop-httpfs/conf.puppet',
        default => $::cdh_httpfs_config_directory,
    }

    $buffer_size = $::cdh_httpfs_buffer_size ? {
        undef   => 4096,
        default => $::cdh_httpfs_buffer_size,
    }

    $secret = $::cdh_httpfs_secret ? {
        undef   => 'hadoop httpfs secret',
        default => $::cdh_httpfs_secret,
    }

    $log4j_config_source = $::cdh_httpfs_log4j_config_source ? {
        undef   => "puppet:///modules/${module_name}/httpfs-log4j.properties",
        default => $::cdh_httpfs_log4j_config_source,
    }
}
