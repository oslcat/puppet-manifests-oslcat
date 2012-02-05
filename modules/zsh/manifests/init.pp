class zsh {
    package { "zsh":
        ensure => present,
    }
}

# config!
define zsh::user_config ($home="/home/${title}") {

    file {
        "${title}-zshrc":
            path    => "${home}/.zshrc",
            ensure  => present,
            content => template("zsh/zshrc.erb");
        "${title}-zshrc.d":
            path    => "${home}/.zshrc.d",
            ensure  => directory;
    }

}
