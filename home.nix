{ config, pkgs, ... }:

{
  home.username = "yukii";
  home.homeDirectory = "/home/yukii";
  home.stateVersion = "24.11"; 

  # User-specific packages
  home.packages = with pkgs; [
    home-manager
    # Fonts
    nerdfonts
    jetbrains-mono
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
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      update = "nh os switch ~/nixos-config";
      clean = "nh clean all";
      nconf = "sudo nvim ~/nixos-config/configuration.nix";
      hconf = "sudo nvim ~/nixos-config/home.nix";
      cursor = "cursor --ozone-platform=wayland";
      code = "code --ozone-platform-hint=auto";
    };
  };
  programs.fish.functions = {
    try = {
      body = ''
        set -l pkg $argv[1]
        set -l cmd $argv[1]
        if test (count $argv) -ge 2
          set cmd $argv[2]
        end

        set -l my_temp_dir (mktemp -d)
        echo "📦 Sandbox Created: $my_temp_dir"

        nix-shell -p $pkg --run "HOME=$my_temp_dir $cmd"

        rm -rf $my_temp_dir
        echo "🗑️ Sandbox Deleted: $my_temp_dir"
      '';
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
  # SSH Configuration
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519_github";
      };
    };
  };

  # .NET Environment Variables
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
  };
  # Nix helper
  programs.nh = {
    enable = true;
    # This sets the NH_FLAKE variable so you don't have to type the path
    flake = "/home/yukii/nixos-config"; 
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  # GNOME settings (Fixes the window centering issue)
  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
  };

  programs.home-manager.enable = true;
}
