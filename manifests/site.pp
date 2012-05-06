if ($::id == "root") {
  $system = true
} else {
  $system = false
}

import "packages.pp"
import "templates/*.pp"
import "nodes/*.pp"
