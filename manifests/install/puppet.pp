#Install ldirectord from puppet location
class ldirectord::install::puppet {
  file { 'ldirectord':
    path   => '/usr/sbin/ldirectord',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => $ldirectord::download_location,
  }
}
