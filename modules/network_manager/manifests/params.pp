class network_manager::params {
    $nm_package = $::operatingsystem ? {
        /Fedora/ => 'NetworkManager',
        /Ubuntu/ => 'network-manager',
        default  => 'network-manager',
    }
}
