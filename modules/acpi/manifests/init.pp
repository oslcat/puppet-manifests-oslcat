class acpi {
  util::system_package {
    'acpi':
      ensure => latest;
    'acpid':
      ensure => latest;
  }

  if $::system {
    service {'acpid':
      ensure    => running,
      path      => '/etc/rc.d',
      hasstatus => false,
    }

    file {'acpi_handler':
      ensure  => present,
      path    => '/etc/acpi/handler.sh',
      content => template('acpi/handler.sh.erb'),
    }

    Package[acpi] -> Package[acpid] -> File[acpi_handler] -> Service[acpid]

    Package[acpi]      ~> Service[acpid]
    Package[acpid]     ~> Service[acpid]
    File[acpi_handler] ~> Service[acpid]
  }
}
