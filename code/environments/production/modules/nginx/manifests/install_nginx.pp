# == Class: nginx::install_nginx
class nginx::install_nginx inherits nginx {

  package { 'nginx':
    ensure => installed,
  }

}
