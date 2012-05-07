class ruby {
  util::system_package {'ruby':
    ensure => latest,
  }
}

class ruby::dev {
  File <| tag == "ruby" |>
}

define ruby::dev::user_config ($home="/home/${title}") {
  @file {
    "${title}-ruby-vim-ftdetect":
      path    => "${home}/.vim/ftdetect/ruby.vim",
      content => template("ruby/ruby.vim.ftdetect.erb"),
      tag     => "vim",
      owner   => "${title}",
      group   => "users",
      ensure  => present;
    "${title}-ruby-vim-ftplugin":
      path    => "${home}/.vim/ftplugin/ruby.vim",
      content => template("ruby/ruby.vim.ftplugin.erb"),
      tag     => "vim",
      owner   => "${title}",
      group   => "users",
      ensure  => present;
  }
}
