# $title is the name of the user this config should exist for
define vim::user_config ($home="/home/${title}", $pathogen=false) {

  @file {
    "vim_dir":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim",
      ensure => directory;
    "vim_ftdetect_dir":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim/ftdetect",
      ensure => directory;
    "vim_syntax_dir":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim/syntax",
      ensure => directory;
    "vim_autoload_dir":
      tag    => "vim",
      owner  => "${title}",
      group  => "users", # XXX
      path   => "${home}/.vim/autoload",
      ensure => directory;

    "vimrc":
      tag       => "vim",
      owner     => "${title}",
      group     => "users",
      path      => "${home}/.vimrc",
      content   => try_templates(["vim/${title}/vimrc.erb", "vim/vimrc.erb"]);
    "vim-zsh":
      tag       => "zsh",
      owner     => "${title}",
      group     => "users",
      path      => "${home}/.zshrc.d/vim",
      content   => try_templates("vim/vim_zshrc.erb");
  }

  if $pathogen {
    @file { "${title}_pathogen_autoload":
      path   => "${home}/.vim/autoload/pathogen.vim",
      source => "puppet:///modules/vim/pathogen/autoload/pathogen.vim",
      ensure => present,
      tag    => "vim",
    }
  }
}
