class mysql {
    include mysql::install_mysql
    include mysql::configure_mysql
    include mysql::service_mysql
}
