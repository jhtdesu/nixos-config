{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      update = "nh os switch ~/nixos-config";
      clean = "nh clean all --keep 2 2>/dev/null";
      nconf = "sudo nvim ~/nixos-config/configuration.nix";
      hconf = "sudo nvim ~/nixos-config/home.nix";
      cursor = "cursor --ozone-platform=wayland";
      code = "code --ozone-platform-hint=auto";
      bios = "sudo systemctl reboot --firmware-setup";
      windows = "sudo grub-reboot 'Windows Boot Manager (on /dev/nvme0n1p1)' && reboot"; 
    };
    
    # Corrected: removed 'programs.fish.' prefix because we are already in the block
    functions = {
      try = {
        body = ''
          set -l pkg $argv[1]
          set -l cmd $argv[1]
          if test (count $argv) -ge 2
            set cmd $argv[2]
          end

          set -l my_temp_dir (mktemp -d)
          echo "📦 Sandbox Created: $my_temp_dir"

          nix-shell -p $pkg --run "HOME=$my_temp_dir $cmd"

          rm -rf $my_temp_dir
          echo "🗑️ Sandbox Deleted: $my_temp_dir"
        '';
      };
    };
  };

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };
}
