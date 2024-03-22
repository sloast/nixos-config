{pkgs, ...}: {
  home.file.".config/zsh_custom" = {
    source = ./zsh_custom;
    recursive = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "lsd";
      ll = "lsd -l";
      l = "lsd -Al";
      ncat = "nvim -R";
      cls = "clear";
      cleanup = "sudo nix-collect-garbage -d";
      rebuild = "~/nixos-config/rebuild";
      ":q" = "exit";
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
