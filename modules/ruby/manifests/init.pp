class ruby {
    package {'ruby':
        ensure => latest,
    }
}

class ruby::dev {
    File <| tag == "ruby" |>
}

define ruby::dev::user_config ($home="/home/${title}") {
    @file { "ruby-vim-config":
        path    => "${home}/.vim/ftdetect/ruby.vim",
        content => template("ruby/ruby.vim.erb"),
        tag     => "vim",
        owner   => "${title}",
        group   => "users",
        ensure  => present;
    }
}
