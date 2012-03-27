class zsh {
    package { "zsh":
        ensure => latest,
    }

    File <| tag == "vim" |>
}

# config!
define zsh::user_config ($home="/home/${title}") {

    @file {
        "${title}_zsh_dir":
            path   => "${home}/.zsh",
            tag    => "zsh",
            owner  => "${title}",
            group  => "users",
            ensure => directory;
        "${title}_zshd":
            path   => "${home}/.zshrc.d",
            tag    => "zsh",
            owner  => "${title}",
            group  => "users",
            ensure => directory;

        "${title}-zshrc":
            path    => "${home}/.zshrc",
            content => template("zsh/zshrc.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-func":
            path    => "${home}/.zshrc.d/00_func",
            content => template("zsh/00_func.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-01_hash_color":
            path    => "${home}/.zshrc.d/01_hash_color",
            content => template("zsh/01_hash_color.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-10_autoterm":
            path    => "${home}/.zshrc.d/10_autoterm",
            content => template("zsh/10_autoterm.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-20_auto_ls":
            path    => "${home}/.zshrc.d/20_auto_ls",
            content => template("zsh/20_auto_ls.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-50_git":
            path    => "${home}/.zshrc.d/50_git",
            content => template("zsh/50_git.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-51_misc":
            path    => "${home}/.zshrc.d/51_misc",
            content => template("zsh/51_misc.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-52_ssh":
            path    => "${home}/.zshrc.d/52_ssh",
            content => template("zsh/52_ssh.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
        "${title}-90_prompt":
            path    => "${home}/.zshrc.d/90_prompt",
            content => template("zsh/90_prompt.erb"),
            tag     => "zsh",
            owner   => "${title}",
            group   => "users",
            ensure  => present;
    }
}
