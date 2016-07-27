class nginx {
      include nginx::install_nginx
      include nginx::configure_nginx
      include nginx::service_nginx
}
