# == Class: nginx::service_nginx
class nginx::service_nginx inherits nginx {

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => [ Package['nginx'], Package['nginx-extras'] ],
  }

}
