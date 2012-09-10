# == Class: cdh::params
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
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

  $repo_key = $::cdh_repo_key ? {
    undef   => '02A818DD',
    default => $::cdh_repo_key
  }

  $repo_key_source = $::cdh_repo_key_source ? {
    undef   => $::lsbdistcodename ? {
      'squeeze' => 'http://archive.cloudera.com/cdh4/debian/squeeze/amd64/cdh/archive.key',
      'lucid'   => 'http://archive.cloudera.com/cdh4/ubuntu/lucid/amd64/cdh/archive.key',
      'precise' => 'http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key',
      default   => fail("The distribution ${::lsbdistcodename} is not supported by this module")
    },
    default => $::cdh_repo_key_source
  }

  $repo_repos = $::cdh_repo_repos ? {
    undef   => 'contrib',
    default => $::cdh_repo_release
  }

  $repo_release = $::cdh_repo_release ? {
    undef   => "${::lsbdistcodename}-cdh4",
    default => $::cdh_repo_release
  }

  $repo_pin = $::cdh_repo_pin ? {
    undef   => 200,
    default => $::cdh_repo_pin
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
    undef   => 'hadoop',
    default => $::cdh_hadoop_package
  }

  $hadoop_version = $::cdh_hadoop_version ? {
    undef   => 'installed',
    default => $::cdh_hadoop_version
  }

  $config_directory = $::cdh_config_directory ? {
    undef   => '/etc/hadoop/conf.puppet',
    default => $::cdh_config_directory
  }

  $hadoop_disks = $::cdh_hadoop_disks ? {
    default => $::cdh_hadoop_disks
  }

  $namenode_package = $::cdh_namenode_package ? {
    undef   => 'hadoop-hdfs-namenode',
    default => $::cdh_namenode_package
  }

  $namenode_service = $::cdh_namenode_service ? {
    undef   => 'hadoop-hdfs-namenode',
    default => $::cdh_namenode_service
  }

  $datanode_package = $::cdh_datanode_package ? {
    undef   => 'hadoop-hdfs-datanode',
    default => $::cdh_datanode_package
  }

  $datanode_service = $::cdh_datanode_service ? {
    undef   => 'hadoop-hdfs-datanode',
    default => $::cdh_datanode_service
  }

  $jobtracker_package = $::cdh_jobtracker_package ? {
    undef   => 'hadoop-0.20-mapreduce-jobtracker',
    default => $::cdh_jobtracker_package
  }

  $jobtracker_service = $::cdh_jobtracker_service ? {
    undef   => 'hadoop-0.20-mapreduce-jobtracker',
    default => $::cdh_jobtracker_service
  }

  $tasktracker_package = $::cdh_tasktracker_package ? {
    undef   => 'hadoop-0.20-mapreduce-tasktracker',
    default => $::cdh_tasktracker_package
  }

  $tasktracker_service = $::cdh_tasktracker_service ? {
    undef   => 'hadoop-0.20-mapreduce-tasktracker',
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

  $log4j_config_source = $::cdh_log4j_config_source ? {
    undef   => "puppet:///modules/${module_name}/log4j.properties",
    default => $::cdh_log4j_config_source
  }
}
