define ruby::dev::user_config ($home="/home/${title}") {
  @file {
    "${title}-ruby-vim-ftdetect":
      ensure  => present;
      path    => "${home}/.vim/ftdetect/ruby.vim",
      content => template('ruby/ruby.vim.ftdetect.erb'),
      tag     => 'vim',
      owner   => $title,
      group   => 'users',
    "${title}-ruby-vim-ftplugin":
      ensure  => present;
      path    => "${home}/.vim/ftplugin/ruby.vim",
      content => template('ruby/ruby.vim.ftplugin.erb'),
      tag     => 'vim',
      owner   => $title,
      group   => 'users',
  }
}
