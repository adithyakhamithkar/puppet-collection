# == Class: php::configure_php
class php::configure_php inherits php {

  file { '/etc/php/7.0/fpm/php.ini':
    ensure  => file,
    notify  => Service['php7.0-fpm'],
    content => template('php/php.ini.erb'),
  }

}
