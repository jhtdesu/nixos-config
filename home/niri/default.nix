{ pkgs, config, inputs, ... }: {
  imports = [
    ./extra.nix
  ];

  home.packages = [
    pkgs.swaylock
    pkgs.niri
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."fuzzel/fuzzel.ini".source = ./fuzzel.ini;
}
