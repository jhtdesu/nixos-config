{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Dev Tools
    vscode dbeaver-bin dotnet-sdk_8 bun
    localsend lazydocker lazygit lazysql docker-compose
    
    # CLI Utilities
    btop fastfetch tldr wget jq yazi bat eza zoxide ripgrep fzf fd xclip
    fishPlugins.fzf-fish
    
    # GUI/Desktop
    fuzzel swaybg alacritty
    nerd-fonts.jetbrains-mono
  ];
}
