class profile::base {

  include ntp
  
  package { 'tree':
    ensure => installed,
    }
    
  package { 'bash-completion':
    ensure => installed,
    }
  
  package { 'zsh':
    ensure => present,
    }
    
  user { 'bob':
    ensure  => present,
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