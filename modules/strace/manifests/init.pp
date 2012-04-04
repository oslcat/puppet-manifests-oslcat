class strace {
  include strace::params
  package { "strace":
    ensure => latest,
    name   => "${strace::params::strace_package}",
  }
}
