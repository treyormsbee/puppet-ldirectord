# == Class: ldirectord
#
# Full description of class ldirectord here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'ldirectord':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class ldirectord(
  $download_location = undef,
  $package_name      = 'ldirectord',
  $configfile_path   = '/etc/ldirector.cf',
  $checkinterval     = '15',
  $checktimeout      = '15',
  $connecttimeout    = undef,
  $negotiatetimeout  = undef,
  $checkcount        = undef,
  $autoreload        = 'no',
  $callback          = undef,
  $quiescent         = 'yes',
  $logfile           = '/var/log/ldirectord.log',
) inherits ldirectord::params {
  #os specific information is here to get ldirectord installed
  include ldirectord::install
  include ldirectord::config
}
