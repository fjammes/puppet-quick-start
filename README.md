# puppet-quick-start

## pre-requisite

```shell
# For all hosts, command below must work:
ping machine.domain.name
```

## MASTER: Install puppet master

```shell
# Enable Dependencies and Puppet Labs Repository On Master
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

# Installing and Upgrading Puppet on the Master Server
yum install puppet-server
puppet resource package puppet-server ensure=latest
/bin/systemctl start  puppetmaster.service
```

## AGENT: Install, configure and start puppet agent

```shell
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install puppet
puppet resource package puppet ensure=latest
# Add name = <master-hostname> to /etc/puppet/puppet.conf
/bin/systemctl start  puppet.service
```

## MASTER: sign certificates

```shell
puppet cert list
puppet cert sign <agent-hostname> 
```

## MASTER: configure nodes

```shell
ln -sf /home/qserv/src/puppet-quick-start/site.pp /etc/puppet/manifests/
puppet parser validate /etc/puppet/manifests/site.pp
```

## AGENT: apply config

```shell
puppet agent -t
```
