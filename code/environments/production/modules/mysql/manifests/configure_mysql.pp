# == Class: mysql::configure_mysql
class mysql::configure_mysql inherits mysql {

$mysql_backup = "/var/mysql_backup"
$mysql_back_email = "mail@email.com"

#Configure mysql server
  file { '/etc/mysql/my.cnf':
    ensure  => file,
    notify  => Service['mysql'],
    content => template('mysql/my.cnf.erb'),
  }

#Create directories for deployment info, error pages and ssl certificates
  file { '/var/mysql_backup':
    ensure  => 'directory',
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
