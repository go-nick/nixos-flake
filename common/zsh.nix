{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      custom = "/home/nick/DEV/Config/zsh-custom";
      theme = "cyberpunk";
      plugins = [ "z" "git" ];
    };
  };
  programs.zsh.interactiveShellInit = ''
    source ~/DEV/Config/config.sh
    source ~/DEV/Config/alias.sh
  '';
}
