class cdh::base (
  $package,
  $config_directory,
  $hadoop_disks,
  $hadoop_version
) {

  # Dependencies
  Class['cdh::repo'] -> Class['cdh::base']

  package { $package:
    ensure  => $hadoop_version,
    notify  => Exec['hadoop-alternatives']
  }

  file { $config_directory:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    purge   => true,
    require => Package[$package]
  }

  cdh::hadoop_directory { $hadoop_disks:
    require => Package[$package]
  }

  exec { 'hadoop-alternatives':
    command     => $::osfamily ? {
        'Debian' => "/usr/sbin/update-alternatives --install /etc/hadoop/conf hadoop-conf ${config_directory} 50",
        'RedHat' => "/usr/sbin/alternatives --install /etc/hadoop/conf hadoop-conf ${config_directory} 50",
      },
    refreshonly => true,
    require     => File[$config_directory],
  }

  #TODO: Make configurable
  cron { 'hadoop-logdelete':
    command => 'find /var/log/hadoop/ -type f -mtime +14 -name "hadoop-hadoop-*" -delete',
    user    => 'root',
    hour    => '3',
    minute  => '0',
  }

}
