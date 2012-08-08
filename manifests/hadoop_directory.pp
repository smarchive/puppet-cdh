define cdh::hadoop_directory() {
  file { "${name}/hadoop":
    ensure => directory,
    owner  => 'root',
    group  => 'hadoop',
  }
}

