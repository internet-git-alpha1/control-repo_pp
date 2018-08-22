#Class: profile::base::base_prompt
#
#
class profile::base:base_prompt {
  file {'/etc/profile.d/puppet_bashprompt.sh':
    ensure => file,
    content => 'export PS1="export PS1="\h@\u:\W\[$(tput sgr0)\]'
    owner => 'root',
    group => 'root',
    root => '0644,'
  }
}
