class puzzles::params {
  $puzzles_package = $::operatingsystem ? {
    /Debian/ => "sgt-puzzles",
    default  => "puzzles",
  }
}
