{ config, pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [ git ];
  users.users = {
    antonin = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJh6W2o61dlOIcBXeWRhXWSYD/W8FDVf3/p4FNfL2L6p duponin@rilakkuma"
      ];
    };
    simon = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOiFv7rm8ChxvFaggUHRWcgGriWxkfiIPxhUSgTeA6n ximun@aquilenet.fr"
      ];
    };
  };
  security = {
    hideProcessInformation = true;
    sudo.wheelNeedsPassword = false;
  };
  services.fail2ban = {
    enable = true;
    bantime-increment.enable = true;
  };
}
