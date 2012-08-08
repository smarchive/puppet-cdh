class cdh::mapreduce (
  $jobtracker,
  $config_directory = $cdh::params::config_directory,
  $hadoop_disks     = $cdh::params::hadoop_disks,
  $max_maps         = $cdh::params::mapreduce_max_maps,
  $max_reduces      = $cdh::params::mapreduce_max_reduces,
  $max_memory       = $cdh::params::mapreduce_max_memory
) inherits cdh::params {
  # Dependencies
  Class['cdh::base'] -> Class['cdh::mapreduce']

  class { 'cdh::mapreduce::config':
    config_directory => $config_directory,
    hadoop_disks     => $hadoop_disks,
    jobtracker       => $jobtracker,
    max_maps         => $cdh::mapreduce_max_maps,
    max_reduces      => $cdh::mapreduce_max_reduces,
    max_memory       => $cdh::mapreduce_max_memory,
  }

  cdh::hadoop_mapreduce_directory { $hadoop_disks: }
}
