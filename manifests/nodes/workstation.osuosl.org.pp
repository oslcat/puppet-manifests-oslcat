node /.*\.workstation\.osuosl\.org/ inherits workstation {
  # You shouldn't put anything here.
}

node workstation {
  class {
    "users::mythmon": user => false;
    "users::simpson": user => false;

    "git": system => false;
    "vim": system => false;
    "zsh": system => false;
  }
}
