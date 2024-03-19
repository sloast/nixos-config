{pkgs, ...}: {
  home.file.".config/zsh_custom" = {
    source = ./zsh_custom;
    recursive = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    shellAliases = {
      ll = "ls -lhN";
      l = "ls -AlhN";
    };

    oh-my-zsh = {
      custom = "$HOME/.config/zsh_custom";

      enable = true;
      theme = "betterussell";
      plugins = [
        "git"
        "npm"
        "history"
        "node"
        "rust"
        "deno"
      ];
    };
  };
}
