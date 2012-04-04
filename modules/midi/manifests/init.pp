class midi {
  include midi::params
  package { "fluidsynth":
    ensure  => present,
  }
  package { "${midi::params::timidity_package}":
    ensure  => present,
  }
}
