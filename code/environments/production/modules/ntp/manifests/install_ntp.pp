# == Class: ntp::install_ntp
class ntp::install_ntp inherits ntp {

  package { 'ntp':
    ensure => installed,
  }

}
