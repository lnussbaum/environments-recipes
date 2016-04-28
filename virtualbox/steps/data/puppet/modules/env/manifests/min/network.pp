class env::min::network {

  # Network configuration
  file {
    '/etc/hosts':
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///modules/env/min/network/hosts";
    '/etc/dhcp/dhclient-exit-hooks.d/g5k-update-host-name':
        owner  => "root",
        group  => "root",
        mode   => '0644',
        source => "puppet:///modules/env/min/network/g5k-update-host-name";
  }

  # TODO : is this still necessary in jessie?
  # Network driver for many dell server
  case $operatingsystem {
    'Debian': {
      $drivers = ['firmware-bnx2x', 'firmware-bnx2']
    }
    'Ubuntu': {
      $drivers = ['linux-firmware']
    }
  }

  package {
    $drivers:
      ensure   => installed;
  }

}
