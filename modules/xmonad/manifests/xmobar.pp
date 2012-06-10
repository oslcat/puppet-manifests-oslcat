class xmonad::xmobar (
  $home="/home/${title}",
  $template='xmonad/xmobar.erb'
)
{
  include xmonad::params

  util::system_package {
    'xmobar':
      ensure => latest,
      name   => $xmonad::params::package_xmobar,
  }

  File <| tag == 'xmobar' |>
}
