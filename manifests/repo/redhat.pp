class cdh::repo::redhat (
  $name,
  $baseurl,
  $gpgkey,
  $gpgcheck,
  $enabled
) {
  yumrepo { $name:
    descr    => "Cloudera's Distribution for Hadoop, Version 4",
    baseurl  => $baseurl,
    gpgkey   => $gpgkey,
    gpgcheck => $gpgcheck,
    enabled  => $enabled,
  }
}
