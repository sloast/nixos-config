{pkgs, ...}: {
  environment.shells = [pkgs.zsh];

  users.users.adaad.shell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    zsh-autoenv.enable = true;
    syntaxHighlighting.enable = true;
  };
}
