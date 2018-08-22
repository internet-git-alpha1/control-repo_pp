define profile::iptables_rule (
  $rule,
) {
  include ntp

  exec { "iptables_${name}":
    command => "iptables ${rule}",
    path    => ["/bin/", "/usr/bin/", "/sbin"],
  }
}
