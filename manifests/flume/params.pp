class cdh::flume::params {
    $flume_package = $::cdh_flume_package ? {
        undef   => 'flume-ng',
        default => $::cdh_flume_package,
    }

    $flume_version = $::cdh_flume_version ? {
        undef   => 'installed',
        default => $::cdh_flume_version,
    }

    $flume_agent_package = $::cdh_flume_agent_package ? {
        undef   => 'flume-ng-agent',
        default => $::cdh_flumeng_package,
    }

    $flume_agent_version = $::cdh_flume_agent_version ? {
        undef   => 'installed',
        default => $::cdh_flume_agent_version,
    }
}
