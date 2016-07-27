# == Class: php::service_php
class php::service_php inherits php {

  service { 'php7.0-fpm':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package['php7.0-fpm'],
  }

}
