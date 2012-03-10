class vim::params {
    $packagename = $::operatingsystem ? {
        /Linux/ => $::ec2_instance_id ? {
            /.+/    => "vim-enhanced",
            default => "vim",
        },
	default => "vim",
    }
}
