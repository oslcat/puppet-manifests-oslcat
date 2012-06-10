# Solarized vim color scheme.

# $title is the name of the user this config should exist for
define vim::solarized ($home="/home/${title}") {

    @vcsrepo { "${home}/.vim/bundle/solarized":
        ensure   => present,
        provider => git,
        source   => 'git://github.com/altercation/vim-colors-solarized.git',
        tag      => "${title}_pathogen";
    }
}
