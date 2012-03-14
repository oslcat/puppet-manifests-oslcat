class vim {
    include vim::params

    package { "vim":
        ensure => present,
        name   => "${vim::params::packagename}",
    }

    Util::User_config_file <| app == "vim" |>
    Util::User_config_dir <| app == "vim" |>
}

# $title is the name of the user this config should exist for
define vim::user_config ($home="/home/${title}") {
    @util::user_config_dir {
        "vim_dir":
            app => "vim",
            user => "${title}",
            path => "${home}/.vim";
        "vim_ftplugin_dir":
            app => "vim",
            user => "${title}",
            path => "${home}/.vim/ftplugin";
        "vim_syntax_dir":
            app => "vim",
            user => "${title}",
            path => "${home}/.vim/syntax";
    }

    @util::user_config_file {
        "vimrc":
            app      => "vim",
            user     => "${title}",
            path     => "${home}/.vimrc",
            template => ["vim/${title}/vimrc.erb", "vim/vimrc.erb"];
        "vim-zsh":
            app      => "zsh",
            user     => "${title}",
            path     => "${home}/.zshrc.d/vim",
            template => "vim/vim_zshrc.erb";
    }
}
