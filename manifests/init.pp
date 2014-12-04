# == Class: ldirectord
#
# Full description of class ldirectord here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#
# === Examples
#
#  class { 'ldirectord':
#    quiescent => 'no',
#    connecttimeout => 10
#  }
#
# === Authors
#
# Author Name <treyormsbee@gmail.com>
#
# === Copyright
#
# Copyright 2014 Trey Ormsbee, unless otherwise noted.
#
class ldirectord(
  $download_location = undef,
  $package_name      = 'ldirectord',
  $configfile_path   = '/etc/ldirectord.cf',
  $checkinterval     = '15',
  $checktimeout      = '15',
  $connecttimeout    = undef,
  $negotiatetimeout  = undef,
  $checkcount        = undef,
  $autoreload        = 'no',
  $callback          = undef,
  $quiescent         = 'yes',
  $logfile           = '/var/log/ldirectord.log',
) {
  #os specific information is here to get ldirectord installed
  include ldirectord::params
  include ldirectord::install
  include ldirectord::config
}
