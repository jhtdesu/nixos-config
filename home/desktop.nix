{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = { opacity = 0.9; padding = { x = 10; y = 10; }; };
      font = {
        size = 11;
        normal.family = "JetBrainsMono Nerd Font";
        bold.family = "JetBrainsMono Nerd Font";
      };
    };
  };

  dconf.settings."org/gnome/mutter".center-new-windows = true;
}
