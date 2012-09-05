class cdh::repo (
  $name,
  $baseurl,
  $release,
  $repos,
  $key,
  $key_source,
  $gpgcheck,
  $enabled,
  $pin
) {
  case $::osfamily {
    'Debian': {
      class { 'cdh::repo::debian':
        repo_name  => $name,
        baseurl    => $baseurl,
        release    => $release,
        repos      => $repos,
        key        => $key,
        key_source => $key_source,
        pin        => $pin,
      }
    }
    'RedHat': {
      class { 'cdh::repo::redhat':
        repo_name => $name,
        baseurl   => $baseurl,
        gpgkey    => $key_source,
        gpgcheck  => $gpgcheck,
        enabled   => $enabled,
      }
    }
    default:  { fail ("OS family ${::osfamily} is not supported by this module") }
  }
}
