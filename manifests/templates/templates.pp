node core {
    include os
    include puppet
    include puppet::fix_it
}

node base inherits core {
    Group {
        ensure => present,
    }
    group {
        "users":;
        "wheel":;
    }

    include vim
    include git
    include zsh

    include users::mythmon
}

node server inherits base {
}

node gui inherits base {
    include x11
    include fonts::all
}

node laptop inherits gui {
}

node desktop inherits gui {
}
