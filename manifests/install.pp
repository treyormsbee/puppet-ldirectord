#Install modukle
class ldirectord::install {
  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        'CentOS': {
          if $operatingsystemrelease =~ /^7/ {
            if !defined(Package['perl-Sys-Syslog'] {
              package { 'perl-Sys-Syslog':
                ensure => installed,
              }
            }
            if !defined(Package['perl-libwww-perl'] {
              package { 'perl-libwww-perl':
                ensure => installed,
              }
            }
          }
          #install dependencies
          if !defined(Package['perl-Socket6']) {
            package { 'perl-Socket6':
              ensure => installed,
            }
          }
          if !defined(Package['perl-IO-Socket-INET6']) {
            package { 'perl-IO-Socket-INET6':
              ensure => installed,
            }
          }
          if !defined(Package['perl-MailTools']) {
            package { 'perl-MailTools':
              ensure => installed,
            }
          }
          if !defined(Package['ipvsadm']) {
            package { 'ipvsadm':
              ensure => installed,
            }
          }
          if !defined(Package['curl']) {
            package { 'curl':
              ensure => installed,
            }
          }
        }
        'Fedora' : {
          #since a package is available should we bother with pulling from puppet or web?
          #for now,  only use package,  will force the setting at a later date
          #in params.pp
          if  $ldirectord::params::download_location =~ /^(puppet|http)/ {
            fail("Operating system (${::operatingsystem}) has a maintained pacakge, installation from puppet/http not supported")
          }
        }
        default: {
          #Should not be here because this was already covered in params.pp
          fail("Unsupported operatingsystem (${::operatingsystem})")
        }
      }
    }
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          if $ldirectord::params::download_location =~ /^(puppet|http)/ {
            fail("Operating system (${::operatingsystem}) has a maintained pacakge, installation from puppet/http not supported")
          }
        }
        'Ubuntu': {
          if $ldirectord::params::download_location =~ /^(puppet|http)/ {
            fail("Operating system (${::operatingsystem}) has a maintained pacakge, installation from puppet/http not supported")
          }
        }
        default: {
          fail("Unsupported operatingsystem (${::operatingsystem})")
        }
      }
    }
    'Suse': {
      case $::operatingsystem {
        'SLES': {
          fail("Operating system (${::operatingsystem}) not supported yet")
        }
        'OpenSuSE': {
          if $ldirectord::params::download_location =~ /^(puppet|http)/ {
            fail("Operating system (${::operatingsystem}) has a maintained pacakge, installation from puppet/http not supported")
          }
        }
        default: {
          fail("Unsupported operatingsystem (${::operatingsystem})")
        }
      }
    }
    default: {
      fail("Unsupported operatingsystem (${::osfamily})")
    }
  }
      
  #we have three choices on how to install, package, puppet web.
  case $ldirectord::params::download_location {
    /^http/: {
      include ldirectord::install::http
    }
    /^puppet/: {
      include ldirectord::install::puppet
    }
    /^package/: {
      include ldirectord::install::package
    }
    default: {
      fail('I do not know how to install ldirectord the way you want: download_location != /^(http|puppet|package)')
    }
  }
}
