#Class: profile::wordpress
#
#

class profile::wordpress {
  include apache
  include wordpress
  include mysql::server

}