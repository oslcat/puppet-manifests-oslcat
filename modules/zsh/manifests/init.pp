class zsh {
    package { "zsh":
        ensure => latest,
    }
}

# config!
define zsh::user_config ($home="/home/${title}") {

    File {
        owner  => "${title}",
        group  => "users", # XXX This should be better.
        ensure => present,
    }

    file {
        "${title}_zsh_dir}":
            path    => "${home}/.zsh",
            ensure  => directory;
        "${title}_zshrc":
            path    => "${home}/.zshrc",
            content => template("zsh/zshrc.erb");
        "${title}_zshrc.d":
            path    => "${home}/.zshrc.d",
            ensure  => directory;

        "${title}_func":
            path    => "${home}/.zshrc.d/00_func",
            content => template("zsh/00_func.erb");

        "${title}_01_hash_color":
            path    => "${home}/.zshrc.d/01_hash_color",
            content => template("zsh/01_hash_color.erb");

        "${title}_10_autoterm":
            path    => "${home}/.zshrc.d/10_autoterm",
            content => template("zsh/10_autoterm.erb");

        "${title}_20_auto_ls":
            path    => "${home}/.zshrc.d/20_auto_ls",
            content => template("zsh/20_auto_ls.erb");

        "${title}_50_git":
            path    => "${home}/.zshrc.d/50_git",
            content => template("zsh/50_git.erb");

        "${title}_50_misc":
            path    => "${home}/.zshrc.d/50_misc",
            content => template("zsh/50_misc.erb");

        "${title}_50_ssh":
            path    => "${home}/.zshrc.d/50_ssh",
            content => template("zsh/50_ssh.erb");

        "${title}_90_prompt":
            path    => "${home}/.zshrc.d/90_prompt",
            content => template("zsh/90_prompt.erb");
    }

}
