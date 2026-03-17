{ pkgs, config, inputs, ... }: {
  imports = [
    ./extra.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.swaylock
    pkgs.niri
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
}
