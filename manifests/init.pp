#
# Copyright 2017 Your name here, unless otherwise noted.
#
class ssh(
  String $package_name,
  String $service_name,
  String $ensure,
  String $service_ensure,
  Boolean $service_enable,
  Boolean $permit_root_login  = false,
  Integer $port               = 22,
) {
  class { '::ssh::service': }
  class { '::ssh::config': }
  class { '::ssh::install': }


  Class['::ssh::install']
  -> Class['::ssh::config']
  ~> Class['::ssh::service']
  -> Class['ssh']
}
