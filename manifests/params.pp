class cdh::params {
  $java_class = $::cdh_java_class ? {
    undef   => 'DISABLED',
    default => $::cdh_java_class
  }

  $repo_name = $::cdh_repo_name ? {
    undef   => 'cloudera-cdh4',
    default => $::cdh_repo_name
  }

  $repo_baseurl = $::cdh_repo_baseurl ? {
    undef   => $::lsbdistcodename ? {
      'squeeze' => 'http://archive.cloudera.com/cdh4/debian/squeeze/amd64/cdh',
      'lucid'   => 'http://archive.cloudera.com/cdh4/ubuntu/lucid/amd64/cdh',
      'precise' => 'http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh',
      default   => fail("The distribution ${::lsbdistcodename} is not supported by this module")
    },
    default => $::cdh_repo_baseurl
  }

  $repo_gpgkey = $::cdh_repo_gpgkey ? {
    undef   => $::lsbdistcodename ? {
      'squeeze' => 'http://archive.cloudera.com/cdh4/debian/squeeze/amd64/cdh/archive.key',
      'lucid'   => 'http://archive.cloudera.com/cdh4/ubuntu/lucid/amd64/cdh/archive.key',
      'precise' => 'http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key',
      default   => fail("The distribution ${::lsbdistcodename} is not supported by this module")
    },
    default => $::cdh_repo_gpgkey
  }

  $repo_repos = $::cdh_repo_repos ? {
    undef   => 'contrib',
    default => $::cdh_repo_release
  }

  $repo_release = $::cdh_repo_release ? {
    undef   => "${::lsbdistcodename}-cdh4",
    default => $::cdh_repo_release
  }

  $repo_release = $::cdh_repo_pin ? {
    undef   => 200,
    default => $::cdh_repo_release
  }

  $repo_gpgcheck = $::cdh_repo_gpgcheck ? {
    undef   => 1,
    default => $::cdh_repo_gpgcheck
  }

  $repo_enabled = $::cdh_repo_enabled ? {
    undef   => 1,
    default => $::cdh_repo_enabled
  }

  $hadoop_package = $::cdh_hadoop_package ? {
    undef   => 'hadoop-0.20',
    default => $::cdh_hadoop_package
  }

  $hadoop_native_package = $::cdh_hadoop_native_package ? {
    undef   => 'hadoop-0.20-native',
    default => $::cdh_hadoop_native_package
  }

  $hadoop_version = $::cdh_hadoop_version ? {
    undef   => 'installed',
    default => $::cdh_hadoop_version
  }

  $config_directory = $::cdh_config_directory ? {
    undef   => '/etc/hadoop-0.20/conf.puppet',
    default => $::cdh_config_directory
  }

  $namenode_package = $::cdh_namenode_package ? {
    undef   => 'hadoop-0.20-namenode',
    default => $::cdh_namenode_package
  }

  $namenode_service = $::cdh_namenode_service ? {
    undef   => 'hadoop-0.20-namenode',
    default => $::cdh_namenode_service
  }

  $datanode_package = $::cdh_datanode_package ? {
    undef   => 'hadoop-0.20-datanode',
    default => $::cdh_datanode_package
  }

  $datanode_service = $::cdh_datanode_service ? {
    undef   => 'hadoop-0.20-datanode',
    default => $::cdh_datanode_service
  }

  $jobtracker_package = $::cdh_jobtracker_package ? {
    undef   => 'hadoop-0.20-jobtracker',
    default => $::cdh_jobtracker_package
  }

  $jobtracker_service = $::cdh_jobtracker_service ? {
    undef   => 'hadoop-0.20-jobtracker',
    default => $::cdh_jobtracker_service
  }


  $tasktracker_package = $::cdh_tasktracker_package ? {
    undef   => 'hadoop-0.20-tasktracker',
    default => $::cdh_tasktracker_package
  }

  $tasktracker_service = $::cdh_tasktracker_service ? {
    undef   => 'hadoop-0.20-tasktracker',
    default => $::cdh_tasktracker_service
  }

  $hdfs_replication = $::cdh_hdfs_replication ? {
    undef   => 3,
    default => $::cdh_hdfs_replication
  }

  $mapreduce_max_maps = $::cdh_mapreduce_max_maps ? {
    undef   => 2,
    default => $::cdh_mapreduce_max_maps
  }

  $mapreduce_max_reduces = $::cdh_mapreduce_max_reduces ? {
    undef   => 2,
    default => $::cdh_mapreduce_max_reduces
  }

  $mapreduce_max_memory = $::cdh_mapreduce_max_memory ? {
    undef   => 1024,
    default => $::cdh_mapreduce_max_memory
  }
}
