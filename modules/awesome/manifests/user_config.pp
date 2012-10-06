define awesome::user_config (
  $home="/home/${title}",
  $template="awesome/rc.lua.erb"
) {
  @file {
  "${title}-config":
    tag    => "awesome",
    path   => "${home}/.config",
    owner  => "${title}",
    group  => "users",
    ensure => directory;
  "${title}-config-awesome":
    tag    => "awesome",
    path   => "${home}/.config/awesome",
    owner  => "${title}",
    group  => "users",
    ensure => directory;
  "${title}-awesomerc":
    tag     => "awesome",
    path    => "${home}/.config/awesome/rc.lua",
    content => template("${template}"),
    owner   => "${title}",
    group   => "users",
    ensure  => present;
  }

  Vcsrepo <| tag == "${title}-awesome-vicious" |>
}
