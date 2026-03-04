{ config, pkgs, ... }: {
  home.username = "yukii";
  home.homeDirectory = "/home/yukii";
  home.stateVersion = "25.11"; 

  imports = [
    ./apps.nix
    ./git.nix
    ./desktop.nix
    ./shell.nix 
    ./waybar.nix
    ./niri
  ];

  programs.home-manager.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/yukii/nixos-config"; 
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 900; # 5 minutes
        command = "${pkgs.swaylock}/bin/swaylock -c 000000";
      }
    ];
  };
  gtk = {
  enable = true;
  theme = {
    name = "Adwaita-dark";
    package = pkgs.gnome-themes-extra;
  };
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
  };
}
