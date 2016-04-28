class env::min::apt::keyring {

  $operatingsystem_downcase = inline_template('<%= @operatingsystem.downcase %>')
  package {
    "${operatingsystem_downcase}-keyring":
      ensure => installed;
  }
  
  case $operatingsystem {
    'Ubuntu', 'Debian': {
      package {
        "debian-archive-keyring":
          ensure => installed;
      }
    }
  }

}
