{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Dev Tools
    vscode dbeaver-bin dotnet-sdk_8 bun nodejs
    localsend lazydocker lazygit lazysql docker-compose
    unzip

    # CLI Utilities
    btop fastfetch tldr wget jq yazi bat eza zoxide ripgrep fzf fd xclip
    fishPlugins.fzf-fish

    # GUI/Desktop
    fuzzel swaybg waypaper ghostty starship
    xwayland-satellite

    # Office
    libreoffice onlyoffice-desktopeditors
  ];

  xdg.desktopEntries.brave-browser = {
    name = "Brave Web Browser";
    genericName = "Web Browser";
    exec = "brave --enable-features=TouchpadOverscrollHistoryNavigation --ozone-platform=wayland %U";
    icon = "brave-browser";
    terminal = false;
    categories = [ "Network" "WebBrowser" ];
    mimeType = [
      "application/pdf"
      "text/html"
      "text/xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
    ];
    actions = {
      "new-window" = {
        name = "New Window";
        exec = "brave --enable-features=TouchpadOverscrollHistoryNavigation --ozone-platform=wayland";
      };
      "new-private-window" = {
        name = "New Incognito Window";
        exec = "brave --enable-features=TouchpadOverscrollHistoryNavigation --ozone-platform=wayland --incognito";
      };
    };
  };
}
