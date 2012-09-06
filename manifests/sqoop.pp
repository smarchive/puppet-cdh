class cdh::sqoop(
  $package             = $cdh::sqoop::params::package,
  $version             = $cdh::sqoop::params::version,
) inherits cdh::sqoop::params {

  package { $package:
    ensure => $version,
  }
}
