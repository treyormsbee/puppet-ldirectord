#Optional paramaters.
class ldirectord::params {
  $http_download_location = 'http://horms.net/projects/ldirectord/download/ldirectord-latest'

  #Requires facter 1.6.1+
  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        /^CentOS|RedHat/: {
          #todo: if CentOS/RedHat 7,  pull from files directory. http download does not work correctly.
          if $ldirectord::download_location == undef {
            #Default is to pull from maintainer since there is no package
            $download_location = $http_download_location
          } else {
            $download_location = $ldirectord::download_location
          }
          $binary_path       = '/usr/sbin/ldirectord'
          $config_path       = '/etc/ldirectord.cf'
          $curl_path         = '/usr/bin/curl'
        }
        'Fedora': {
          if $ldirectord::download_location == undef {
            #Fedora has an ldirectord package,  make that default
            $download_location = 'package'
          } else {
            $download_location = $ldirectord::download_location
          }
          $binary_path       = '/usr/sbin/ldirectord'
          $config_path       = '/etc/ldirectord.cf'
          $curl_path         = '/usr/bin/curl'
        }
        default: {
          #Need to verify, Centos 5/6/7, Redhat 5/6/7 
          #and Fedora down to the last supported version.
          fail("Unsupported operatingsystem (${::operatingsystem})")
        }
      }
    }
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if $ldirectord::download_location == undef {
            #Debian has an ldirectord package,  make that default
            $download_location = 'package'
          } else {
            $download_location = $ldirectord::download_location
          }
          $binary_path       = '/usr/sbin/ldirectord'
          $config_path       = '/etc/ldirectord.cf'
          $curl_path         = '/usr/bin/curl'
        }
        'Ubuntu': {
          if $ldirectord::download_location == undef {
            #Debian has an ldirectord package,  make that default
            $download_location = 'package'
          } else {
            $download_location = $ldirectord::download_location
          }
          $binary_path       = '/usr/sbin/ldirectord'
          $config_path       = '/etc/ldirectord.cf'
          $curl_path         = '/usr/bin/curl'
        }
        default: {
          fail("Unsupported operatingsystem (${::operatingsystem})")
        }
      }
    }
    'Suse': {
      case $::operatingsystem {
        'SLES': {
          if $ldirectord::download_location == undef {
            #Default is to pull from maintainer since there is no package
            $download_location = $download_location
          } else {
            $download_location = $ldirectord::download_location
          }
          $binary_path       = '/usr/sbin/ldirectord'
          $config_path       = '/etc/ldirectord.cf'
          $curl_path         = '/usr/bin/curl'
        }
        'OpenSuSE': {
          if $ldirectord::download_location == undef {
            #Debian has an ldirectord package,  make that default
            $download_location = 'package'
          } else {
            $download_location = $ldirectord::download_location
          }
          $binary_path       = '/usr/sbin/ldirectord'
          $config_path       = '/etc/ldirectord.cf'
          $curl_path         = '/usr/bin/curl'
        }
        default: {
          #Should probably remove sles,  the package is in HAE 
          #the defualt install from the web gives errors
          fail("Unsupported operatingsystem (${::operatingsystem})")
        }
      }
    }
    default: {
      fail("Unsupported osamily (${::osfamily})")
    }
  }
}
