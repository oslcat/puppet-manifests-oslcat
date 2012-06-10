define puppet::dev::user_config ($home="/home/${title}") {
  @file {
    "puppet-vim-syntax-${title}":
      ensure  => present,
      path    => "${home}/.vim/syntax/puppet.vim",
      tag     => 'vim',
      owner   => $title,
      group   => 'users',
      content => template('puppet/puppet.syntax.vim.erb');
    "puppet-vim-ftdetect-${title}":
      ensure  => present,
      path    => "${home}/.vim/ftdetect/puppet.vim",
      tag     => 'vim',
      owner   => $title,
      group   => 'users',
      content => template('puppet/puppet.ftdetect.vim.erb');
    "puppet-vim-ftplugin-${title}":
      ensure  => present,
      path    => "${home}/.vim/ftplugin/puppet.vim",
      tag     => 'vim',
      owner   => $title,
      group   => 'users',
      content => template('puppet/puppet.ftplugin.vim.erb');
  }
}
