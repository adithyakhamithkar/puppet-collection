# == Class: ntp::service_ntp
class ntp::service_ntp inherits ntp {

  service { 'ntp':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package['ntp'],
  }

}
