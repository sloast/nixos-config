{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night";
    font = {
      name = "FiraCodeNerdFont";
      size = 14;
    };
    shellIntegration.enableZshIntegration = true;
  };
}
