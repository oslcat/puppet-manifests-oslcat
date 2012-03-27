class ruby {
    package {'ruby':
        ensure => latest,
    }
}

define ruby::dev::user_config ($home="/home/${title}") {
    @util::user_config_file {"ruby-vim-config":
        app     => "vim",
        user    => "${title}",
        path    => "${home}/.vim/ftdetect/ruby.vim",
        template => "ruby/ruby.vim.erb";
    }
}
