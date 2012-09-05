class cdh::repo::debian (
  $repo_name,
  $baseurl,
  $release,
  $repos,
  $key,
  $key_source,
  $pin
) {
  apt::source { $repo_name:
    location   => $baseurl,
    release    => $release,
    repos      => $repos,
    key        => $key,
    key_source => $key_source,
    pin        => $pin,
  }
}
