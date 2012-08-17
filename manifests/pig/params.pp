class cdh::pig::params {
    $pig_package = $::cdh_pig_package ? {
        undef   => 'pig',
        default => $::cdh_pig_package,
    }

    $pig_version = $::cdh_pig_version ? {
        undef   => 'installed',
        default => $::cdh_pig_version,
    }
}
