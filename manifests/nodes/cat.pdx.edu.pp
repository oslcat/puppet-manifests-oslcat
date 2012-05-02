node 'observatory.cat.pdx.edu'{
#  $basic_needs = ['htop', 'git', 'vim', 'iptraf']
#  $best_in_class = ['/home/nibz/sanbox/one', '/home/nibz/sandbox/two']
  
  stage { 'setup': before => Stage['main'] }

  class {
    'setup':  stage => 'setup';
#    'post':   stage => 'main';
  }

}
