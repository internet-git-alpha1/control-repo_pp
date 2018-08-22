class profile::base {

  include ntp

  package { 'tree':
      ensure    => installed,
  }

  package { 'bash-completion':
      ensure    => installed,
  }

  package { 'zsh':
      ensure =>   present,
  }

  package { 'iptables':
    ensure  => installed,
    }

  user { 'bob':
    ensure     => present,
    uid        => 1337,
    gid        => 1337,
    home       => '/home/bob',
    shell      => '/bin/zsh',
    managehome => true,
    require    => Package['zsh']
  }

  group { 'bob':
      ensure => present,
      gid    => 1337,
  }

  exec { 'install netdata':
    command => 'curl -Ss https://my-netdata.io/kickstart.sh | /bin/bash -s all --dont-wait --dont-start-it',
    path    => ['/bin/', '/usr/bin/'],
    unless  => "test -d /etc/netdata",
  }

  service { 'netdata':
    ensure  => 'running',
    require => Exec['install netdata'],
  }

  profile::iptables_rule { 'netdata':
    rule    => '-t nat -I PREROUTING -p tcp --dport 8081 -j REDIRECT --to-ports 19999',
    require => Service['netdata'],
  }
  
if $facts['pe_server_version'] =~ /.+/ {
  contain profile::base::base_prompt
}

 notify { lookup('message'):
 }

}
