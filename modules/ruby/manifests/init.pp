class ruby {
    package {'ruby':
        ensure => latest,
    }
}

define ruby::user_config ($home="/home/${title}") {
    @util::user_config_file {"ruby-vim-config":
        app     => "vim",
        user    => "${title}",
        path    => "${home}/.vim/ftplugin/ruby.vim",
        template => "ruby/ruby.vim.erb";
    }
}
