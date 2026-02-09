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
        timeout = 300; # 5 minutes
        command = "${pkgs.swaylock}/bin/swaylock -c 000000";
      }
      {
        timeout = 600; # 10 minutes
        command = "${pkgs.niri}/bin/niri msg action power-off-monitor";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitor";
      }
    ];
  };
}
