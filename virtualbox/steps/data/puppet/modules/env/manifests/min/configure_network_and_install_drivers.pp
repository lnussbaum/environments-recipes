class env::min::configure_network_and_install_drivers {

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

  # Network driver for many dell server
  $drivers = ['firmware-bnx2x', 'firmware-bnx2']

  package {
    $drivers:
      ensure   => installed;
  }

}
