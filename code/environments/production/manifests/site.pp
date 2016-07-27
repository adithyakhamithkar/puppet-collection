node default {
  include common
  include ntp
}

node puppet-agent {
  include nginx
}
