{
  # NETWORK
  networking = {
    useDHCP = false;
    defaultGateway = "192.168.68.1";
    nameservers = ["192.168.68.1" "8.8.8.8" "1.1.1.1"];
    interfaces.<interface_here>.ipv4.addresses = [{
        address = "192.168.68.<ip_here>";
        prefixLength = 24;
    }];
  };

  services.openssh = {
  enable = true;
  settings = {
      PasswordAuthentication = true; # temporary to true to start this
      PermitRootLogin = "no";
    };
  };

  services.syncthing = {
    enable = true;
    user = "nick";
    dataDir = "/home/nick";
    configDir = "/home/nick/.config/syncthing";
    guiAddress = "0.0.0.0:8384";
  };
  environment.systemPackages = with pkgs; [
    git
    gcc
    gnumake
    gnupg
    unzip
    nodejs
    curl
    wget
    htop
    tmux
  ];
  networking.firewall.allowedTCPPorts = [ 8384 ];
}
