group { 'qserv':
    ensure => 'present',
    gid    => '1001',
}
user { 'qserv':
  ensure           => 'present',
  home             => '/home/qserv',
  comment           => 'Qserv account',
  groups            => 'qserv',
  password         => 'CHANGEME',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1000',
}
