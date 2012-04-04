define puppet::dev::user_config ($home="/home/${title}") {
  @file {
    "puppet-vim-syntax":
      path    => "${home}/.vim/syntax/puppet.vim",
      ensure  => present,
      tag     => "vim",
      owner   => "${title}",
      group   => "users",
      content => template("puppet/puppet.syntax.vim.erb");
    "puppet-vim-ftdetect":
      path    => "${home}/.vim/ftdetect/puppet.vim",
      ensure  => present,
      tag     => "vim",
      owner   => "${title}",
      group   => "users",
      content => template("puppet/puppet.ftdetect.vim.erb");
    "puppet-vim-ftplugin":
      path    => "${home}/.vim/ftplugin/puppet.vim",
      ensure  => present,
      tag     => "vim",
      owner   => "${title}",
      group   => "users",
      content => template("puppet/puppet.ftplugin.vim.erb");
  }
}
