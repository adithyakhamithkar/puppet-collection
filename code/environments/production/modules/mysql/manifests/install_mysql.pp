# == Class: mysql::install_mysql
class mysql::install_mysql inherits mysql {

#Install mysql and automysql backup
  package { [
      'mysql-server',
      'mysql-client',
      'automysqlbackup',
      ]:
      ensure  => 'installed',
    }

}
