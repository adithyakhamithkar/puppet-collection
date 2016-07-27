# == Class: mysql::service_mysql
class mysql::service_mysql inherits mysql {

  service { 'mysql':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => [ Package['mysql-server'], Package['mysql-client'] ],
  }

}
