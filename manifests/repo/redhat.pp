class cdh::repo::redhat (
  $repo_name,
  $baseurl,
  $gpgkey,
  $gpgcheck,
  $enabled
) {
  yumrepo { $repo_name:
    descr    => 'Cloudera Distribution for Hadoop, Version 4',
    baseurl  => $baseurl,
    gpgkey   => $gpgkey,
    gpgcheck => $gpgcheck,
    enabled  => $enabled,
  }
}
