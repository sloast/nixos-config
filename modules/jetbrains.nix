{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea-ultimate ["github-copilot"])
  ];
}
