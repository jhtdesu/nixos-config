{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      confirm-close-surface = false;
      background-opacity = 0.9;
      background-blur-radius = 20;
      window-padding-x = 10;
      window-padding-y = 10;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 11;
    };
  };
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    '';
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$character";
      directory = {
        style = "bold cyan";
        truncation_length = 3;
        format = "[$path]($style) ";
      };
      git_branch = {
        format = "[(\\($branch\\))]($style) ";
        style = "bold purple";
      };
      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold red";
      };
      character = {
        success_symbol = "[𝘹](bold green)";
        error_symbol = "[𝘹](bold red)";
      };
    };
  };
}
