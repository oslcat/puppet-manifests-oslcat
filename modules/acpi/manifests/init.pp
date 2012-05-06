class acpi {
  util::system_package {
    "acpi":
      ensure => latest;
    "acpid":
      ensure => latest;
  }

  if $::system {
    service {"acpid":
      path      => "/etc/rc.d",
      ensure    => running,
      hasstatus => false,
    }

    file {"acpi_handler":
      path    => '/etc/acpi/handler.sh',
      content => template('acpi/handler.sh.erb'),
      ensure  => present,
    }

    Package[acpi] -> Package[acpid] -> File[acpi_handler] -> Service[acpid]

    Package[acpi]      ~> Service[acpid]
    Package[acpid]     ~> Service[acpid]
    File[acpi_handler] ~> Service[acpid]
  }
}
