define xmonad::user_config (
  $home="/home/${title}",
  $xmonad_template="xmonad/xmonad.erb",
  $xmobar_template="xmonad/xmobar.erb"
) {
  @file {
    "xmonad_dir_${title}":
      tag    => "xmonad",
      owner  => "${title}",
      group  => "users",
      path   => "${home}/.xmonad",
      ensure => directory;

    "xmonadhs_${title}":
      tag       => "xmonad",
      owner     => "${title}",
      group     => "users",
      path      => "${home}/.xmonad/xmonad.hs",
      content   => template("${xmonad_template}");
  }

  @file {
    "xmobarhs_${title}":
      tag       => "xmobar",
      owner     => "${title}",
      group     => "users",
      path      => "${home}/.xmonad/xmobar",
      content   => template("${xmobar_template}");
  }
}
