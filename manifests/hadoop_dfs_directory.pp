define cdh::hadoop_dfs_directory() {
  file { "${name}/hadoop/dfs":
    ensure => directory,
    owner  => 'hdfs',
    group  => 'hadoop',
  }
}

