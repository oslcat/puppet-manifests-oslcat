define awesome::vicious ($home="/home/${title}") {

    @vcsrepo { "${home}/.config/awesome/vicious":
        ensure   => present,
        provider => git,
        source   => "http://git.sysphere.org/vicious/",
        tag      => "${title}-awesome-vicious";
    }
}
