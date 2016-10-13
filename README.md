# puppet-bootstrap

[`r10k.yaml`]: https://github.com/juaningan/puppet-bootstrap/blob/master/r10k.yaml.erb
[`puppet.conf`]: https://github.com/juaningan/puppet-bootstrap/blob/master/puppet.conf
[`r10k.pp`]: https://github.com/juaningan/puppet-bootstrap/blob/master/manifests/r10k.pp
[`puppet.pp`]: https://github.com/juaningan/puppet-bootstrap/blob/master/manifests/puppet.pp

## Module
Module for installing the r10k package, configuring puppet and r10k to deploy code from a puppet controlrepo.

## Setup
#### Previous steps
You need to install both puppet agent and git, and this repository cloned:
``` shell
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet-agent
yum install -y git
git clone https://github.com/juaningan/puppet-bootstrap
```

#### Environment variables
For the correct usage of this module, it needs the follwoing facter variables to be set:
- FACTER_PUPADIR  Absolute path to the cloned git repository
- FACTER_R10K_CONTROLREPO  Puppet controlrepo to be used, i.e. https://github.com/puppetlabs/control-repo
- FACTER_R10K_PUPPETFORGE  Puppet forge server to be used, i.e. https://forge.puppet.com
- FACTER_RUBYGEMS_SOURCE  Ruby gems source for installing r10k, i.e. https://rubygems.org
- FACTER_CONFDIR  Puppet configuration files directory.
- FACTER_CODEDIR  Puppe code directory.
  
```shell
export FACTER_PUPADIR=$(echo $PWD/./puppet-bootstrap)
export FACTER_R10K_CONTROLREPO='https://github.com/puppetlabs/control-repo'
export FACTER_R10K_PUPPETFORGE='https://forge.puppet.com'
export FACTER_RUBYGEMS_SOURCE='https://rubygems.org'
export FACTER_CONFDIR=$(/opt/puppetlabs/bin/puppet config print confdir)
export FACTER_CODEDIR=$(/opt/puppetlabs/bin/puppet config print codedir)
```

### Applying the puppet code
After setting the necessary variables, use the agent to apply both puppet code files:
```shell
/opt/puppetlabs/puppet/bin/puppet apply ${FACTER_PUPADIR}/manifests/puppet.pp
/opt/puppetlabs/puppet/bin/puppet apply ${FACTER_PUPADIR}/manifests/r10k.pp
```
### The files

- [`r10k.pp`] Installs and configures r10k using the given template.
- [`puppet.pp`] Uses the given template for configuring a minimal and masterless puppet agent.
- [`r10k.yaml`] r10k configuration file template.
- [`puppet.conf`] puppet configuration file.
