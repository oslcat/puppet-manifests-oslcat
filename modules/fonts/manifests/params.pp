class fonts::params {
    $dina_package = 'dina-font'
    $dina_ensure = $::operatingsystem ? {
        /Ubuntu/ => 'absent',
        /Fedora/ => 'absent',
        default  => 'latest',
    }
    $inconsolata_package = $::operatingsystem ? {
        /Fedora/                  => 'levien-inconsolata-fonts',
        /Archlinux|Ubuntu|Debian/ => 'ttf-inconsolata',
        default                   => 'inconsolata',
    }
    $inconsolata_ensure = 'latest'
}
