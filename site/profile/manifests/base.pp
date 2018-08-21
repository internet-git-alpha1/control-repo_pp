class profile::base {

  include ntp
  
  package { 'zsh':
    ensure => present,
    }
  user { 'bob':
    endure  => present,
    uid     => 1337,
    gid     => 1337,
    home    => '/home/bob',
    shell   => '/bin/zsh',
    managehome => true,
    require => Package['zsh'],
    
    }
   group { 'bob':
    ensure  => present,
    gid     => 1337,
        }
}