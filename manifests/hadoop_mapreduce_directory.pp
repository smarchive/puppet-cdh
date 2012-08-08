define cdh::hadoop_mapreduce_directory() {
  file { "${name}/hadoop/mapreduce":
    ensure => directory,
    owner  => 'mapred',
    group  => 'hadoop',
  }
}
