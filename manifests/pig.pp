class cdh::pig(
  $package = $cdh::pig::params::package,
  $version = $cdh::pig::params::version,
) inherits cdh::pig::params {

  package { $package:
    ensure => $version,
  }
}
