class strace::params {
    $strace_package = $::operatingsystem ? {
        /Fedora/ => 'strace',
        default  => 'strace',
    }
}
