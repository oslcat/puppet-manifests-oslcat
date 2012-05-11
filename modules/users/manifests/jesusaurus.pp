class users::jesusaurus (
  $home = '/home/jesusaurus',
) inherits users {

  user { 'jesusaurus':
    ensure   => present,
    home     => $home,
    shell    => '/bin/zsh',
    comment  => 'RAWR',
    groups   => [
      'audio',
      'video',
      'wheel',
    ],
  }

  vcsrepo { "${home}/.files/":
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/jesusaurus/dotFiles.git',
    revision => $::hostname,
    notify   => Exec[ 'update-config' ],
    require  => User[ 'jesusaurus' ],
  }

  exec { 'update-config':
    cwd         => "${home}/.files/",
    path        => "${home}/.files/",
    command     => './link.sh yes',
    refreshonly => true,
    subscribe   => Vcsrepo[ "${home}/.files/" ],
  }

}
