file { "${::confdir}/puppet.conf":
  ensure => 'file',
  #owner  => 'root',
  #group  => 'root',
  #mode   => '0644',
  source => "${pupadir}/puppet.conf",
}

