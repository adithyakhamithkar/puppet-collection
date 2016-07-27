# == Class: common::install_misc
class common::install_misc inherits common {

  package { [
     'curl',
     'git',
     'zip',
     'unzip',
     'vim',
     'logrotate',
     'ufw',
     'python-pip',
     'ttf-ancient-fonts',
     'xclip',
     'nscd',
     'python-software-properties',
  ]:
  ensure  => 'installed',
  }

}
