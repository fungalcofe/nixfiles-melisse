{ config, pkgs, lib, ... }:
let admin_groups = [ "wheel" "libvirtd" ];
in {

  environment.systemPackages = with pkgs; [ git ];
  users = {
    mutableUsers = false;
    users = {
      antonin = {
        isNormalUser = true;
        extraGroups = admin_groups;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJh6W2o61dlOIcBXeWRhXWSYD/W8FDVf3/p4FNfL2L6p duponin@rilakkuma"
        ];
      };
      simon = {
        isNormalUser = true;
        extraGroups = admin_groups;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOiFv7rm8ChxvFaggUHRWcgGriWxkfiIPxhUSgTeA6n ximun@aquilenet.fr"
        ];
      };
    };
  };
  security = {
    hideProcessInformation = true;
    sudo.wheelNeedsPassword = false;
  };
  services = {
    fail2ban = {
      enable = true;
      bantime-increment.enable = true;
    };
    openssh = {
      enable = true;
      challengeResponseAuthentication = false;
      passwordAuthentication = false;
      permitRootLogin = "no";
    };
  };
}
