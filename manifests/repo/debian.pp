class cdh::repo::debian (
  $name,
  $baseurl,
  $release,
  $repos,
  $gpgkey,
  $pin
) {
  apt::source { $name:
    location   => $baseurl,
    release    => $release,
    repos      => $repos,
    key_source => $gpgkey,
    pin        => $pin,
  }
}
