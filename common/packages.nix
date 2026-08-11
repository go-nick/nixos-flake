{ pkgs, ... }:

{
  # Docker + Virtualisation
  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # utils
    neovim
    navi
    atuin
    ripgrep # LazyVim's fuzzy finder dependency
    fd      # same, file finder

    # core
    git
    gh
    gcc
    gnumake
    gnupg
    unzip
    nodejs
    curl
    wget
    htop
    btop
    tmux

    # golang
    go
    gopls
    golangci-lint

    # kubernetes client tooling
    kubectl
    kubernetes-helm
    k9s
    kubectx # fast context/namespace switching
    docker-compose
    lazydocker
    fluxcd
    kustomize
  ];
}
