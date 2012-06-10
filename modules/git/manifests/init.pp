class git ($hub=false) {
  $hub_ensure = $hub ? {
    true    => latest,
    default => absent,
  }

  util::system_package {
    'git':;
    'hub':
      ensure   => $hub_ensure,
      provider => 'gem';
  }

  File <| tag == 'git' |>
}
