$ruby_version_cmp = versioncmp($facts['ruby']['version'], '2.3.0')
$r10k_version = $ruby_version_cmp ? {
  /(1|0)/ => 'latest',
  '-1' => '3.0.0'
}

package { 'r10k':
  ensure   => $r10k_version,
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
