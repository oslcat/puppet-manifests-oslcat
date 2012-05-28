node 'observatory.cat.pdx.edu'{
  
  stage { 'setup': before => Stage['main'] }

  class {
    'setup':  stage => 'setup';
  }

}
