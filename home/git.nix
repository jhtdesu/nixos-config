{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Yukii";
        email = "your-email@example.com";
      };
      init.defaultBranch = "master";
      core.editor = "nvim";
    };
  };

  programs.ssh = {
    enable = true;
    matchBlocks."github.com" = {
      hostname = "github.com";
      identityFile = "~/.ssh/id_ed25519_github";
    };
  };
}
