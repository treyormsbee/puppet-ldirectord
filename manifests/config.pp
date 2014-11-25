# Config options for ldirectord module
# Variables here come from the class difintion ldirecotrd
class ldirectord::config {

  #make are config variables local
  $in_configfile_path   = $ldirectord::configfile_path
  $in_checkinterval     = $ldirectord::checkinterval
  $in_checktimeout      = $ldirectord::checktimeout
  $in_connecttimeout    = $ldirectord::connecttimeout
  $in_negotiatetimeout  = $ldirectord::negotiatetimeout
  $in_checkcount        = $ldirectord::checkcount
  $in_autoreload        = $ldirectord::autoreload
  $in_callback          = $ldirectord::callback
  $in_quiescent         = $ldirectord::quiescent
  $in_logfile           = $ldirectord::logfile

  concat { $in_configfile_path:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => 644,
  }

  concat::fragment { 'global_opts':
    target  => $in_configfile_path,
    content => template('ldirectord/ldirectord.global.cf.erb'),
    order   => '00',
  }
}
