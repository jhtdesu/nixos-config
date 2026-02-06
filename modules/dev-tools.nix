{ pkgs, ... }: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc zlib fuse3 icu nss openssl curl expat glib gtk3
  ];
}
