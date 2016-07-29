# == Class: php::install_php
class php::install_php inherits php {

package { 'language-pack-en-base':
  ensure => installed,
}

#Adding php7 repo
  exec { "Add php7 repo":
    command     => "sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php",
    provider    => shell,
  }

#Update cache
  exec { "update_cache_php":
    command     => "sudo apt-get update",
    provider    => shell,
  }

#Install php7
  package { [
    'php7.0-fpm',
    'php7.0-mysql',
    'php7.0-curl',
    'php7.0-gd',
    'php7.0-json',
    'php7.0-mcrypt',
    'php7.0-opcache',
    'php7.0-xml',
  ]:
  ensure  => 'installed',
  }

}
