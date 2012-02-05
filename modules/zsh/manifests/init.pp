class zsh {
    package { "zsh":
        ensure => latest,
    }
}

# config!
define zsh::user_config ($home="/home/${title}") {

    file {
        "${title}_zsh_dir}":
            path    => "${home}/.zsh",
            ensure  => directory;
        "${title}_zshrc":
            path    => "${home}/.zshrc",
            ensure  => present,
            content => template("zsh/zshrc.erb");
        "${title}_zshrc.d":
            path    => "${home}/.zshrc.d",
            ensure  => directory;
    }

}
