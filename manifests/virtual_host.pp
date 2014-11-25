#Define a virtual host entry in the config file.
#this should probably be in another config file.. balh blah
define ldirectord::virtual_host(
  $entrynumber,
  $name,
  $virtual,
  $real,
  $real_options,
  $port,
  $service,
  $protocol,
  $scheduler,
  $checktype = undef,
  $checkport = undef,
  $httpmethod = undef,
  $virtualhost = undef,
  $login = undef,
  $passwd = undef,
  $database = undef,
  $request = undef,
  $receive = undef,
  $checktype = undef,
  $netmask = undef,
  $persistent = undef,
) {
  #If needed,  we could do advance error checking of the options here. 
  #I think people should just put them in correctly and test
  concat::fragment { $name:
    target  => $ldirectord::configfile_path,
    content => template('ldirectord/ldirectord.virtual.cf.erb'),
    order   => $entrynumber,
  }
}
