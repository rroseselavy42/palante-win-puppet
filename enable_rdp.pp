class enable_rdp {
  service { 'TermService':
    enable => true,
    ensure => running,
    }
}
