#Class: profile::wordpress
#
#

class profile::wordpress {
  include apache
  include wordpress
  include mysql::server
  include apache::mod::php

  package { ['php-mysql', 'php-mysqlnd']:
    ensure =>  installed,
    notify => Service['httpd'],
  }
}
