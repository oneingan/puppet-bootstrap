package { 'r10k':
  ensure   => latest,
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
