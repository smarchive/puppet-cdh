class cdh::repo::debian (
  $repo_name,
  $baseurl,
  $release,
  $repos,
  $gpgkey,
  $pin
) {
  apt::source { $repo_name:
    location   => $baseurl,
    release    => $release,
    repos      => $repos,
    key_source => $gpgkey,
    pin        => $pin,
  }
}
