class xmonad::xmobar (
  $home="/home/${title}",
  $template="xmonad/xmobar.erb"
)
{
  include xmonad::params

  package {
    "xmobar":
      name   => "${xmonad::params::package_xmobar}",
      ensure => latest,
  }

  File <| tag == "xmobar" |>
}
