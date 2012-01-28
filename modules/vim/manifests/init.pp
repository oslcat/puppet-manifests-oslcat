class vim {
    package { "vim":
        ensure => present,
    }
}

# $title is the name of the user this config should exist for
define vim::config ($home="/home/${title}") {

    $user = $title

    file {
        "${user}-vimrc":
            path    => "${home}/.vimrc",
            ensure  => present,
            content => template("vim/vimrc.erb");

        "${user}-vim-zshrc":
            # Require a zsh config for this user.
            require => Zsh::Config["${user}"],
            path    => "${home}/.zshrc.d/vim",
            content => template("vim/vim_zshrc.erb");
    }
}
