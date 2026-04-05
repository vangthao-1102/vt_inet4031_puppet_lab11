package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

package { 'libapache2-mod-php':
  ensure  => installed,
  notify  => Service['apache2'],
  require => Package['apache2'],
}

package { 'php-cli':
  ensure  => installed,
  notify  => Service['apache2'],
  require => Package['apache2'],
}

package { 'php-mysql':
  ensure  => installed,
  notify  => Service['apache2'],
  require => Package['apache2'],
}

file { '/var/www/html/phpinfo.php':
  source => '/home/vang1102/vt_inet4031_puppet_lab11/phpinfo.php',
  notify  => Service['apache2'],
  require => [Package['apache2']]
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [
    Package['apache2'], 
    Package['php'], 
    Package['libapache2-mod-php'], 
    Package['php-cli'], 
    Package['php-mysql'],
  ],
}

package { 'mariadb-server':
  ensure => installed, 
}

service { 'mariadb':
  ensure => running; 
  enable => true; 
  require => Package['mariadb-server'],
}
