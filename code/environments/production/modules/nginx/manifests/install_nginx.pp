# == Class: nginx::install_nginx
class nginx::install_nginx inherits nginx {

  exec { "nginx_repo":
    command     => "sudo add-apt-repository ppa:nginx/development",
    provider => shell,
  }

  exec { "update_cache":
    command     => "sudo apt-get update",
    provider => shell,
  }

  package { [
    'nginx',
    'nginx-extras',
  ]:
  ensure  => 'installed',
  }

}
