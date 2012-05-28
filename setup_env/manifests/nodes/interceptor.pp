node "interceptor.nibalizer.com" {
  
  stage { 'setup': before => Stage['main'] }

  class {
    'setup':  stage => 'setup';
  }
  
}
