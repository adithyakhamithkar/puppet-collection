# == Class: mysql::configure_mysql
class mysql::configure_mysql inherits mysql {

$mysql_backup = "/var/mysql_backup"
$mysql_back_email = "mail@email.com"

#Create directories for deployment info, error pages and ssl certificates
  file { 'mysql_backup':
    path    => $mysql_backup,
    ensure  => 'directory',
    }

#Configure mysql server
  file { '/etc/mysql/my.cnf':
    ensure  => file,
    notify  => Service['mysql'],
    content => template('mysql/my.cnf.erb'),
  }

#Configure automysqlbackup
  file { '/etc/default/automysqlbackup':
    ensure  => file,
    content => template('mysql/automysqlbackup.erb'),
  }

#Start automysqlbackup
  exec { "automysqlbackup":
    command     => "sudo automysqlbackup",
    provider    => shell,
  }
}
