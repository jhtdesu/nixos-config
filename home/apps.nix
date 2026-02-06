{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Dev Tools
    vscode code-cursor dbeaver-bin dotnet-sdk_8
    localsend lazydocker lazygit docker-compose
    
    # CLI Utilities
    btop fastfetch tldr wget jq yazi bat eza zoxide ripgrep fzf fd xclip
    fishPlugins.fzf-fish
    
    # GUI/Desktop
    niri fuzzel swaybg alacritty
    nerd-fonts.jetbrains-mono
  ];
}
