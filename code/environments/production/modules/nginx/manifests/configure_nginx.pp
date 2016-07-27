# == Class: nginx::configure_nginx
class nginx::configure_nginx inherits nginx {

$doc_root = "/usr/share/nginx/html"

#Change nginx.conf
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    notify  => Service['nginx'],
    content => template('nginx/nginx.conf.erb'),
  }

#Create directories for deployment info, error pages and ssl certificates
  file { [
      '/usr/share/nginx/deployment_info',
      '/usr/share/nginx/error_pages',
      '/etc/nginx/ssl'
  ]:
  ensure  => 'directory',
  }

#Copy new index page and error pages
  file { '/usr/share/nginx/html/index.html':
    ensure  => file,
    notify  => Service['nginx'],
    content => template('nginx/index.html.erb'),
    }
  file { '/usr/share/nginx/error_pages/error-page-50x.html':
    ensure  => file,
    content => template('nginx/error-page-50x.html.erb'),
    }
  file { '/usr/share/nginx/error_pages/error-page-403.html':
    ensure  => file,
    content => template('nginx/error-page-403.html.erb'),
    }
  file { '/usr/share/nginx/error_pages/error-page-404.html':
    ensure  => file,
    content => template('nginx/error-page-404.html.erb'),
    }

#Copy ssl cerificates
  file { '/etc/nginx/ssl/ssl_crt.pem':
    ensure  => file,
    content => template('nginx/ssl_crt.pem'),
    }
  file { '/etc/nginx/ssl/ssl_key.pem':
    ensure  => file,
    content => template('nginx/ssl_key.pem'),
    }
  file { '/etc/nginx/ssl/dhparam.pem':
    ensure  => file,
    content => template('nginx/dhparam.pem'),
    }

#Configure virtual host
  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    notify  => Service['nginx'],
    content => template('nginx/default.erb'),
  }
  file { '/etc/nginx/sites-enabled/default':
    ensure  => file,
    notify  => Service['nginx'],
    content => template('nginx/default.erb'),
  }
  file { '/etc/nginx/sites-enabled/default-ssl':
    ensure  => file,
    notify  => Service['nginx'],
    content => template('nginx/default-ssl.erb'),
  }
  file { '/etc/nginx/sites-available/default-ssl':
    ensure  => file,
    notify  => Service['nginx'],
    content => template('nginx/default-ssl.erb'),
  }

}
