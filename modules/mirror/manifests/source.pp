class mirror::source (
  $mirror,
) {

  if ! ($operatingsystem in ['Ubuntu']) {
    fail("class does not support $operatingsystem")
  }

# This means that all future desired repositories must be managed by Puppet
  class { 'apt':
    purge_sources_list   => true,
    purge_sources_list_d => true;
  }

  case $mirror {
    'cat': { include mirror::source::cat }
    'osuosl': { include mirror::source::osuosl }
    default: { fail("Module does not support '$mirror'") }
  }
}
