# == Class: ntp::configure_ntp
class ntp::configure_ntp inherits ntp {

  file { '/etc/ntp.conf':
    ensure  => file,
    content => template('ntp/ntp.conf.erb'),
  }

}
