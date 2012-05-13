node "fritz" inherits laptop {

  class { 'mirror::source':
    mirror => 'cat',
  }

  class { 'users::jesusaurus': 
    home       => '/home/jesusaurus',
    github_key => '/home/jesusaurus/.ssh/imbatman',
  }

}
