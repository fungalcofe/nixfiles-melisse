{ config, pkgs, ... }:
let hostname = "rishi";
in {
  imports = [ # imports
    ../../../modules/monitoring/prometheus.nix
    ../../../modules/monitoring/client.nix
    ../../common
    ../../common/qemu-guest
    ../../common/qemu-guest/uefi.nix
  ];

  monitoring.client.enable = true;
  monitoring.client.host = hostname;

  networking = {
    defaultGateway6 = {
      address = "2a0c:e304:c0fe:1::1";
      interface = "ens3";
    };
    hostName = "rishi";
    nameservers = [ "2a0c:e300::100" "2a0c:e300::101" ];
    interfaces = {
      ens3 = {
        mtu = 1500;
        ipv6 = {
          addresses = [{
            address = "2a0c:e304:c0fe:1::3";
            prefixLength = 64;
          }];
        };
      };
    };
  };

  system.stateVersion = "20.09";
}
