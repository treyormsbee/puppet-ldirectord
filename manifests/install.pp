#Install modukle
class ldirectord::install {
  case $::osfamily {
    'RedHat': {
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
    'Debian': {
      if $ldirectord::download_location =~ /^(package|http)/ {
        if !defined(Package['ipvsadm']) {
          package { 'ipvsadm':
            ensure => installed,
          }
        }
        if !defined(Package['libauthen-radius-perl']) {
          package { 'libauthen-radius-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libconvert-asn1-perl']) {
          package { 'libconvert-asn1-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libcrypt-ssleay-perl']) {
          package { 'libcrypt-ssleay-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libdbi-perl']) {
          package { 'libdbi-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libdigest-hmac-perl']) {
          package { 'libdigest-hmac-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libencode-locale-perl']) {
          package { 'libencode-locale-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libfile-listing-perl']) {
          package { 'libfile-listing-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libfont-afm-perl']) {
          package { 'libfont-afm-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhtml-form-perl']) {
          package { 'libhtml-form-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhtml-format-perl']) {
          package { 'libhtml-format-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhtml-parser-perl']) {
          package { 'libhtml-parser-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhtml-tagset-perl']) {
          package { 'libhtml-tagset-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhtml-tree-perl']) {
          package { 'libhtml-tree-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhttp-cookies-perl']) {
          package { 'libhttp-cookies-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhttp-daemon-perl']) {
          package { 'libhttp-daemon-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhttp-date-perl']) {
          package { 'libhttp-date-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhttp-message-perl']) {
          package { 'libhttp-message-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libhttp-negotiate-perl']) {
          package { 'libhttp-negotiate-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libio-socket-inet6-perl']) {
          package { 'libio-socket-inet6-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libio-socket-ssl-perl']) {
          package { 'libio-socket-ssl-perl':
            ensure => installed,
          }
        }
        if !defined(Package['liblwp-mediatypes-perl']) {
          package { 'liblwp-mediatypes-perl':
            ensure => installed,
          }
        }
        if !defined(Package['liblwp-protocol-https-perl']) {
          package { 'liblwp-protocol-https-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libmail-pop3client-perl']) {
          package { 'libmail-pop3client-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libmailtools-perl']) {
          package { 'libmailtools-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-daemon-perl']) {
          package { 'libnet-daemon-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-dns-perl']) {
          package { 'libnet-dns-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-http-perl']) {
          package { 'libnet-http-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-imap-simple-perl']) {
          package { 'libnet-imap-simple-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-imap-simple-ssl-perl']) {
          package { 'libnet-imap-simple-ssl-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-ip-perl']) {
          package { 'libnet-ip-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-ldap-perl']) {
          package { 'libnet-ldap-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libnet-ssleay-perl']) {
          package { 'libnet-ssleay-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libparse-recdescent-perl']) {
          package { 'libparse-recdescent-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libplrpc-perl']) {
          package { 'libplrpc-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libsocket6-perl']) {
          package { 'libsocket6-perl':
            ensure => installed,
          }
        }
        if !defined(Package['liburi-perl']) {
          package { 'liburi-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libwww-perl']) {
          package { 'libwww-perl':
            ensure => installed,
          }
        }
        if !defined(Package['libwww-robotrules-perl']) {
          package { 'libwww-robotrules-perl':
            ensure => installed,
          }
        }
      }
    }
    default: {
      fail('I do not know how ti install ldirectord on your OS, Sorry')
    }
  }
      
  #we have three choices on how to install, package, puppet web.
  case $ldirectord::download_location {
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
      fail('I do not know how to install ldirectord, sorry.')
    }
  }
}
