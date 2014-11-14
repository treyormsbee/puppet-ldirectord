#Optional paramaters.
class ldirectord::params {
  #location of latest binary,  change to puppet, or package, to install from pupept or repo package.
  #$download_location = "http://horms.net/projects/ldirectord/download/ldirectord-latest"

  #Requires facter 1.6.1+
  case $::osfamily {
    'RedHat': {
      $binary_path       = '/usr/sbin/ldirectord'
      $config_path       = '/etc/ldirectord.cf'
      $curl_path         = '/usr/bin/curl'
    }
    'Debian': {
      $binary_path       = '/usr/sbin/ldirectord'
      $config_path       = '/etc/ldirectord.cf'
      $curl_path         = '/usr/bin/curl'
    }
    default: {
      fail("Unsupported lsbdistid (${::lsbdistid})")
    }
  }
}
