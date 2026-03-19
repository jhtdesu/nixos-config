{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      if not set -q SSH_AUTH_SOCK
        set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
      end
    '';
    shellAliases = {
      update = "nh os switch ~/nixos-config";
      clean = "nh clean all --keep 2 2>/dev/null";
      code = "code --ozone-platform-hint=auto";
      bios = "sudo systemctl reboot --firmware-setup";
      windows = "sudo grub-reboot 'Windows Boot Manager (on /dev/nvme0n1p1)' && reboot";
      optimise = "nix-store --optimise";
      clean-dotnet = "rm -rf ~/.nuget/packages";
    };
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
}
