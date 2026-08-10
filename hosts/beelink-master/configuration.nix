{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      /home/nick/DEV/Nicklab/nixos/secrets/beelink-master.nix
      /home/nick/DEV/Nicklab/nixos/secrets/security.nix
      /home/nick/DEV/Nicklab/nixos/secrets/syncthing.nix
      /home/nick/DEV/Nicklab/nixos/flake/common/network.nix
      /home/nick/DEV/Nicklab/nixos/flake/common/packages.nix
      /home/nick/DEV/Nicklab/nixos/flake/common/users.nix
      /home/nick/DEV/Nicklab/nixos/flake/common/utils.nix
      /home/nick/DEV/Nicklab/nixos/flake/common/zsh.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NETWORK
  networking.hostName = "beelink-master";
  networking.interfaces.eno1.ipv4.addresses = [{
    address = "192.168.68.15";
    prefixLength = 24;
  }];

  # KUBERNETES
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = "--disable=helm-controller --write-kubeconfig=/home/nick/.kube/config --write-kubeconfig-mode=600";
  };
  systemd.tmpfiles.rules = [
    "d /home/nick/.kube 0700 nick users -"
  ];
  systemd.services.k3s.serviceConfig.ExecStartPost = [
    "+${pkgs.writeShellScript "fix-kubeconfig-owner" ''
      for i in $(seq 1 30); do
        [ -f /home/nick/.kube/config ] && break
        sleep 1
      done
      chown nick:users /home/nick/.kube/config
    ''}"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
