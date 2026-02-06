{ pkgs, ... }: {
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_SG.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_SG.UTF-8";
    LC_IDENTIFICATION = "en_SG.UTF-8";
    LC_MEASUREMENT = "en_SG.UTF-8";
    LC_MONETARY = "en_SG.UTF-8";
    LC_NAME = "en_SG.UTF-8";
    LC_NUMERIC = "en_SG.UTF-8";
    LC_PAPER = "en_SG.UTF-8";
    LC_TELEPHONE = "en_SG.UTF-8";
    LC_TIME = "en_SG.UTF-8";
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    max-jobs = 2;
    cores = 0;
    auto-optimise-store = true;
  };

  documentation.enable = false;
  documentation.nixos.enable = false;
  documentation.man.enable = false;

  nixpkgs.config.allowUnfree = true;
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}
