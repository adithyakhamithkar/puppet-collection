class ntp {
    include ntp::install_ntp
    include ntp::configure_ntp
    include ntp::service_ntp
}
