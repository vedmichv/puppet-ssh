#
# Copyright 2017 Your name here, unless otherwise noted.
#
class ssh(
  Boolean $permit_root_login  = $::ssh::params::permit_root_login,
  String $package_name        = $::ssh::params::package_name,
  String $service_name        = $::ssh::params::service_name,
) inherits ::ssh::params {
  class { '::ssh::service': }
  class { '::ssh::config': }
  class { '::ssh::install': }


  Class['::ssh::install']
  -> Class['::ssh::config']
  ~> Class['::ssh::service']
  -> Class['ssh']
}
