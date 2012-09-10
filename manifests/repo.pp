# == Class: cdh::repo
#
# === Authors
#
# Jochen Schalanda <j.schalanda@smarchive.de>
#
# === Copyright
#
# Copyright 2012 smarchive GmbH
#
class cdh::repo (
  $repo_name        = $cdh::params::repo_name,
  $baseurl          = $cdh::params::repo_baseurl,
  $release          = $cdh::params::repo_release,
  $repos            = $cdh::params::repo_repos,
  $pin              = $cdh::params::repo_pin,
  $key              = $cdh::params::repo_key,
  $key_source       = $cdh::params::repo_key_source,
  $gpgcheck         = $cdh::params::repo_gpgcheck,
  $enabled          = $cdh::params::repo_enabled,
) inherits cdh::params {

  case $::osfamily {
    'Debian': {
      class { 'cdh::repo::debian':
        repo_name  => $repo_name,
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
        repo_name => $repo_name,
        baseurl   => $baseurl,
        gpgkey    => $key_source,
        gpgcheck  => $gpgcheck,
        enabled   => $enabled,
      }
    }
    default:  { fail ("OS family ${::osfamily} is not supported by this module") }
  }
}
