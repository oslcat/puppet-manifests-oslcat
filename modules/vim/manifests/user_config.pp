# $title is the name of the user this config should exist for
define vim::user_config (
  $home="/home/${title}",
  $pathogen=false,
  $template='vim/vimrc.erb'
) {
  @file {
    "vim_dir_${title}":
      ensure => directory;
      tag    => 'vim',
      owner  => $title,
      group  => 'users', # XXX
      path   => "${home}/.vim",
    "vim_ftdetect_dir_${title}":
      ensure => directory;
      tag    => 'vim',
      owner  => $title,
      group  => 'users', # XXX
      path   => "${home}/.vim/ftdetect",
    "vim_ftplugin_dir_${title}":
      ensure => directory;
      tag    => 'vim',
      owner  => $title,
      group  => 'users', # XXX
      path   => "${home}/.vim/ftplugin",
    "vim_syntax_dir_${title}":
      ensure => directory;
      tag    => 'vim',
      owner  => $title,
      group  => 'users', # XXX
      path   => "${home}/.vim/syntax",
    "vim_autoload_dir_${title}":
      ensure => directory;
      tag    => 'vim',
      owner  => $title,
      group  => 'users', # XXX
      path   => "${home}/.vim/autoload",
      ensure => directory;

    "vimrc_${title}":
      ensure    => 'present',
      tag       => 'vim',
      owner     => $title,
      group     => 'users',
      path      => "${home}/.vimrc",
      content   => template($template);
    "vim_zsh_${title}":
      ensure    => 'present',
      tag       => 'zsh',
      owner     => $title,
      group     => 'users',
      path      => "${home}/.zshrc.d/vim",
      content   => template('vim/vim_zshrc.erb');
  }

  if $pathogen {
    @file {
      "${title}_pathogen_autoload":
        ensure => present,
        path   => "${home}/.vim/autoload/pathogen.vim",
        source => 'puppet:///modules/vim/pathogen/autoload/pathogen.vim',
        tag    => 'vim';
      "${title}_pathogen_bundle":
        ensure => directory,
        path   => "${home}/.vim/bundle",
        tag    => 'vim';
    }

    Vcsrepo <| tag == "${title}_pathogen" |>
  }
}

