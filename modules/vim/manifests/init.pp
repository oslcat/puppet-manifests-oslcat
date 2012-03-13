class vim {
    include vim::params

    package { "vim":
        ensure => present,
        name   => "${vim::params::packagename}",
    }

    Util::User_config_file <| app == "vim" |>
}

# $title is the name of the user this config should exist for
define vim::user_config ($home="/home/${title}") {

    @util::user_config_file {
        "vimrc":
            app     => "vim",
            user    => "${title}",
            path    => "${home}/.vimrc",
            template => "vim/vimrc.erb";
        "vim-zsh":
            app     => "zsh",
            user    => "${title}",
            path    => "${home}/.zshrc.d/vim",
            template => "vim/vim_zshrc.erb";
    }
}
