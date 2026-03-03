{ pkgs, config, ... }: {
  imports = [
    ./extra.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.swaylock
    pkgs.swaybg
    pkgs.nerd-fonts.jetbrains-mono 
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

  programs.niri = {
    enable = true;
    config = builtins.readFile ./config.kdl;
  };
}
