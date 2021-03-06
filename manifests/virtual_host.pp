#Define a virtual host entry in the config file.
define ldirectord::virtual_host(
  $virtual,
  $real,
  $real_options,
  $port,
  $protocol,
  $scheduler,
  $service = undef,
  $fallback = undef,
  $fallback_options = undef,
  $fallback_port = undef,
  $entrynumber = $name,
  $checktype = undef,
  $checkport = undef,
  $checkcommand = undef,
  $checktimeout = undef,
  $checkinterval = undef,
  $failurecount = undef,
  $httpmethod = undef,
  $virtualhost = undef,
  $login = undef,
  $passwd = undef,
  $database = undef,
  $request = undef,
  $receive = undef,
  $netmask = undef,
  $persistent = undef,
) {
  #If needed,  we could do advance error checking of the options here.
  #I think people should just put them in correctly and test
  concat::fragment { $title:
    target  => $ldirectord::configfile_path,
    content => template('ldirectord/ldirectord.virtual.cf.erb'),
    order   => $name,
  }
}
