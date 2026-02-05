{ config, pkgs, ... }:

{
  home.username = "yukii";
  home.homeDirectory = "/home/yukii";
  home.stateVersion = "24.11"; 

  # User-specific packages
  home.packages = with pkgs; [
    # Home manager
    home-manager
    # Niri
    niri
    # Fuzzel launcher
    fuzzel
    swaybg
    # Fonts
    nerd-fonts.jetbrains-mono
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
    alacritty
  ];
  # Move your aliases here
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      update = "nh os switch ~/nixos-config";
      clean = "nh clean all --keep 2 2>/dev/null";
      nconf = "sudo nvim ~/nixos-config/configuration.nix";
      hconf = "sudo nvim ~/nixos-config/home.nix";
      cursor = "cursor --ozone-platform=wayland";
      code = "code --ozone-platform-hint=auto";
      bios = "sudo systemctl reboot --firmware-setup";
      windows = "sudo grub-reboot 'Windows Boot Manager (on /dev/nvme0n1p1)' && reboot";
    };
  };
  # Try app/package temporary
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
  # Git Configurations
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Yukii";
        email = "your-email@example.com";
      };
      # This replaces your old extraConfig
      init.defaultBranch = "master";
      core.editor = "nvim";
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
  # Alacritty Configurations
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
	opacity = 0.9;
	padding = { x = 10; y = 10; };
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        size = 11; 
      };
    };
  };

  # .NET Environment Variables
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    EDITOR = "nvim";
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
