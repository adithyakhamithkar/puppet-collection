# == Class: nginx::configure_nginx
class nginx::configure_nginx inherits nginx {

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    notify  => Service['nginx'],
    content => template('nginx/nginx.conf.erb'),
  }

}
