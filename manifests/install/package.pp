#Install from os package
class ldirectord::install::package {
  package { $ldirectord::package_name:
    ensure => installed,
  }
}
