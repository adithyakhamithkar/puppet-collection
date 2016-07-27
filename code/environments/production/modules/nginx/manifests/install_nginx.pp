# == Class: nginx::install_nginx
class nginx::install_nginx inherits nginx {

#Adding nginx repo
  exec { "nginx_repo":
    command     => "sudo add-apt-repository ppa:nginx/development",
    provider    => shell,
  }

#Update cache
  exec { "update_cache":
    command     => "sudo apt-get update",
    provider    => shell,
  }

#Install nginx
  package { [
    'nginx',
    'nginx-extras',
  ]:
  ensure  => 'installed',
  }

}
