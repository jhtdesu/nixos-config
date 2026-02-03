{ config, pkgs, ... }:

{
  home.username = "yukii";
  home.homeDirectory = "/home/yukii";
  home.stateVersion = "24.11"; 

  # User-specific packages
  home.packages = with pkgs; [
    home-manager
    # Dev Tools
    vscode
    code-cursor 
    dbeaver-bin
    dotnet-sdk_8
    localsend
    lazydocker
    lazygit
    docker-compose
    
    # CLI Utilities
    btop
    fastfetch
    tldr
    wget
    jq
    yazi
    bat
    eza
    zoxide
    ripgrep
    fzf
    fishPlugins.fzf-fish
    fd
    xclip
  ];

  # Move your aliases here
  programs.fish = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#jhtdesu";
      clean = "sudo nix-collect-garbage -d";
      nconf = "nvim ~/nixos-config/configuration.nix";
      hconf = "nvim ~/nixos-config/home.nix";
      cursor = "cursor --ozone-platform=wayland";
      code = "code --ozone-platform-hint=auto";
    };
  };
  # Git Identity
  programs.git = {
    enable = true;
    userName = "Jhtdesu";
    userEmail = "jhtdesu@gmail.com"; 
    extraConfig = {
      init.defaultBranch = "master";
    };
  };

  # .NET Environment Variables
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
  };

  # GNOME settings (Fixes the window centering issue)
  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
  };

  programs.home-manager.enable = true;
}
