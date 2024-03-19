{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      adaad = import ./home.nix;
    };
  };
}
