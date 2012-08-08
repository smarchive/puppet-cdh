class cdh::repo (
  $name,
  $baseurl,
  $release,
  $repos,
  $gpgkey,
  $gpgcheck,
  $enabled,
  $pin
) {
  case $::osfamily {
    'Debian': {
      class { 'cdh::repo::debian':
        name     => $name,
        baseurl  => $baseurl,
        release  => $release,
        repos    => $repos,
        gpgkey   => $gpgkey,
        pin      => $pin,
      }
    }
    'RedHat': {
      class { 'cdh::repo::redhat':
        name     => $name,
        baseurl  => $baseurl,
        gpgkey   => $gpgkey,
        gpgcheck => $gpgcheck,
        enabled  => $enabled,
      }
    }
    default:  { fail ("OS family ${::osfamily} is not supported by this module") }
  }
}
