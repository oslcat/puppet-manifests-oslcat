class users::jesusaurus (
  $home       = "/home/jesusaurus",
  $github_key = "$home/.ssh/id_rsa",
) inherits users {

  user { 'jesusaurus':
    ensure   => present,
    home     => "$home",
    shell    => "/bin/zsh",
    comment  => "RAWR",
    groups   => [
      "audio",
      "video",
      "wheel",
    ],
  }

  vcsrepo { "$home/.files/":
    provider => git,
    ensure   => latest,
    source   => "git://github.com/jesusaurus/dotFiles.git",
    revision => "$hostname",
    remote   => "github",
    identity => $github_key,
    notify   => Exec[ "update-config" ],
    require  => User[ 'jesusaurus' ],
  }

  exec { "update-config":
    cwd         => "$home/.files/",
    path        => "$home/.files/",
    command     => "./link.sh yes",
    refreshonly => true,
    subscribe   => Vcsrepo[ "$home/.files/" ],
  }

}
