class puzzles {
  include puzzles::params
  util::system_package {
    "${puzzles::params::puzzles_package}":
  }
}
