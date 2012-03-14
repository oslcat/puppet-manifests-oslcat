class zsh {
    package { "zsh":
        ensure => latest,
    }

    Util::User_config_file <| app == "zsh" |> {}
}

# config!
define zsh::user_config ($home="/home/${title}") {

    @util::user_config_dir {
        "${title}_zsh_dir":
            path => "${home}/.zsh",
            app  => "zsh",
            user => "${title}";
        "${title}_zshd":
            path => "${home}/.zshrc.d",
            app  => "zsh",
            user => "${title}";
    }

    @util::user_config_file {
        "${title}-zshrc":
            path     => "${home}/.zshrc",
            template => "zsh/zshrc.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-func":
            path     => "${home}/.zshrc.d/00_func",
            template => "zsh/00_func.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-01_hash_color":
            path     => "${home}/.zshrc.d/01_hash_color",
            template => "zsh/01_hash_color.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-10_autoterm":
            path     => "${home}/.zshrc.d/10_autoterm",
            template => "zsh/10_autoterm.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-20_auto_ls":
            path     => "${home}/.zshrc.d/20_auto_ls",
            template => "zsh/20_auto_ls.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-50_git":
            path     => "${home}/.zshrc.d/50_git",
            template => "zsh/50_git.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-51_misc":
            path     => "${home}/.zshrc.d/51_misc",
            template => "zsh/51_misc.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-52_ssh":
            path     => "${home}/.zshrc.d/52_ssh",
            template => "zsh/52_ssh.erb",
            app  => "zsh",
            user => "${title}";
        "${title}-90_prompt":
            path     => "${home}/.zshrc.d/90_prompt",
            template => "zsh/90_prompt.erb",
            app  => "zsh",
            user => "${title}";
    }
}
