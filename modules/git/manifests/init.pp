class git ($hub=false) {
  util::system_package {
    "git":;
    "hub":
      provider => "gem",
      ensure   => $hub ? {
        true  => latest,
        false => absent,
      };
  }

  File <| tag == "git" |>
}
