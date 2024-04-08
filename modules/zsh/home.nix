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

    defaultKeymap = "viins";

    initExtra = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    '';

    shellAliases = {
      ls = "lsd";
      ll = "lsd -l";
      l = "lsd -Al";
      lr = "lsd -R";
      ncat = "nvim -R";
      cls = "clear";
      cleanup = "sudo nix-collect-garbage -d";
      rebuild = "~/nixos-config/rebuild";
      ":q" = "exit";
      less = "less -FR";
      tp = "trash-put";
      tl = "trash-list";
      nixdev = "nix develop -c $SHELL";
      nvimdiff = "git difftool -y";
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
        "zsh-abbr"
      ];
    };
  };

  programs.fzf.enableZshIntegration = true;
  programs.kitty.shellIntegration.enableZshIntegration = true;
}
