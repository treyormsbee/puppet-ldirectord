#Download ldirector from maintainer
class ldirectord::install::http {
  file { $ldirectord::params::binary_path:
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => '/var/tmp/ldirectord-latest',
    require => Exec['get_ldirectord'],
  }
  exec { 'get_ldirectord':
    command => "${ldirectord::params::curl_path} -k ${ldirectord::download_location}  -o /var/tmp/ldirectord-latest",
    onlyif  => '/bin/bash -c \'[ ! -f /var/tmp/ldirectord-latest ]\''
  }
}
