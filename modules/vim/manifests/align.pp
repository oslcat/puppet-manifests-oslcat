# Align vim plugin user config

# $title is the name of the user this config should exist for
define vim::align ($home="/home/${title}") {

    @vcsrepo { "${home}/.vim/bundle/align":
        ensure   => present,
        provider => git,
        source   => "git://github.com/pix/vim-align.git",
        tag      => "${title}_pathogen";
    }
}
