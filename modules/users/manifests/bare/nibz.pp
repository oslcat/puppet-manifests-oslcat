class users::bare::nibz (
  $username = 'nibz',
  $home     = '/home/nibz',
  $uid      = 1861
){

  if $system {
    user { $username:
      ensure     => present,
      home       => $home,
      uid        => $uid,
      gid        => "users",
      groups     => ['users',],
      managehome => true,
      shell      => '/bin/bash',
    }
  }
  file {"$home/.ssh":
     ensure => directory,
     owner  => $username,
     group  => $users,
     mode   => 0700,
  }
  ssh_authorized_key { "nibz/observatory.cat.pdx.edu":
     ensure => present,
     user   => nibz,
     type   => 'ssh-rsa',
     key    => "AAAAB3NzaC1yc2EAAAADAQABAAACAQC40Hibr2nJR0okjnpFXu/dHPXJ6ZftM5\
Rw5iJAOLtA3AINTVCFNP+WlaLJTvJ96TKe18UffUAmF9eUPMvG3mYtX6Z4pTNp7adjpylw3AfbWmiE\
s9co6755laGsc6+L4xNw8jYDXZuyciuPoQFBClLjjYahJmJ4JK2B7DdUxDKzpVvYo2vKzm+FczGaEv\
Brb5yhBe8XnECB1Whe4kBxXDIaxNNC04lKwc/SkPJ1oZZ0+9Tfbwdl+1mnEJdOUnsGFUvxUa+UlVA1\
Rik7bXjDYT0YoQ2B723AQ+2OPSvGpeqYYHPYJnJJ0jf2opAOopD6TT02Mg70qHEu5JbynqkxjJ+Ige\
yr/Yol5X1EwTK52/0gsDgeAuths9MSafDZ9HIp3r9fCCAaxNo4+33B4yJK4vriLQCExg2VW2mvYnkR\
uaVar76HNqO4OZkL6SBO/rHBiyIkVhm1/hvZTjBupkI20Zo4wAvMTLye3RWappaozJf1IzzdhI6HKX\
BKzK9oLQgiGQQ9zje1Yf3YmJDwyZQ/rOOnfoxc0U2fT2Vq0AXkd/TjAn9EZks7v5MY2mKREVif4sk2\
mN+mtWv6KNntEMdotwMnjdTViQMHmig2EppWGC2lb5b1pcJWZMgG2mWv8MC2SZ5Rpn5ZGf5Mz/ilkp\
tn+Yd717cInhmx8iP6E2P3e9Nkvw==",
     require => File["$home/.ssh"],
  }
}
