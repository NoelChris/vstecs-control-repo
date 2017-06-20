class profile::compliance::corp_std::rhel_ssh (
  $root = 'yes',
  ){

  file { '/etc/issue':
    ensure  => file,
    content => template('profile/openssh/banner.erb'),
  }

  # The $root parameter is being passed to the template to enable toggling of root logins
  file { '/etc/ssh/sshd_config':
    ensure  => file,
    content => template('profile/openssh/sshd_config.erb'),
  }

  service { 'sshd':
    ensure    => 'running',
    enable    => true,
    subscribe => File['/etc/ssh/sshd_config'],
  }

}
