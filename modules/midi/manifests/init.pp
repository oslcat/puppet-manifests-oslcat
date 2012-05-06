class midi {
  include midi::params
  util::system_package {
    "fluidsynth":;
    "${midi::params::timidity_package}":;
  }
}
