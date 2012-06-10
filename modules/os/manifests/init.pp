class os {
  case $::operatingsystem {
    /Archlinux/: {
      include os::arch
    }
    default: {
    }
  }
}
