package { 'cri':
  ensure   => '2.8',
  provider => 'puppet_gem',
  source   => $::rubygems_source,
}
package { 'r10k':
  ensure   => '3.0.0',
  provider => 'puppet_gem',
  source   => $::rubygems_source,
}

file { "${::confdir}/r10k.yaml":
  ensure  => 'file',
  #owner   => 'root',
  #group   => 'root',
  #mode    => '0644',
  content => template("${pupadir}/r10k.yaml.erb"),
}
