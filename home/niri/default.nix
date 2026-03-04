{ pkgs, config, inputs, ... }: {
  imports = [
    ./extra.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.swaylock
    pkgs.swaybg
    pkgs.nerd-fonts.jetbrains-mono 
    inputs.niri.packages.x86_64-linux.niri-unstable
  ];
  
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        extraOptions = {
          "AddKeysToAgent" = "yes";
        };
      };
    };
  };

  programs.waybar = {
    enable = true;
  };

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
 }
