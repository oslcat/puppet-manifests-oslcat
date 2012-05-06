## mirror class: module to manage apt sources for OSL and CAT mirrors
###  Example Usage:

    class { 'mirror::source':
      mirror => 'cat',
    }

    or

    class { 'mirror::source':
      mirror => 'osuosl',
    }

### WARNING: WILL PURGE YOUR CURRENT /etc/apt/sources.list
