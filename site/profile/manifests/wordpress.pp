#Class: profile::wordpress
#
#

class profile::wordpress {
  include apache
  include wordpress
  include mysql::server
  include apache::mod::php

  package { 'php-mysqlnd':
    ensure =>  installed,
    notify => Service['httpd'],
  }
}
