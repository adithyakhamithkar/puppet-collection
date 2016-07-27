node default {
  include common
  include ntp
}

node puppet-agent {
  include common
  include ntp
  include nginx
}
