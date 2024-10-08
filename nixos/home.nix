# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports =
    [
      # If you want to use home-manager modules from other flakes (such as nix-colors):
      # inputs.nix-colors.homeManagerModule
    ]
    ++ (import ../modules/home-default.nix);

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "adaad";
    homeDirectory = "/home/adaad";
    sessionVariables = {
      PATH = "$PATH:$HOME/.local/bin";
      EDITOR = "nvim";
    };
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      #vim-lsp
    ];
  };

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.color_scheme = 'AdventureTime'
      config.font = wezterm.font("FiraCode Nerd Font")
      config.font_size = 14
      config.enable_wayland = false

      return config
    '';
  };

  xdg = {
    enable = true;

    mimeApps = {
      enable = true;
      associations.added = {
        "x-scheme-handler/http" = ["firefox"];
        "x-scheme-handler/https" = ["firefox"];
        "inode/directory" = ["kitty -e ranger"];
      };
      defaultApplications = {
        "x-scheme-handler/http" = ["firefox"];
        "x-scheme-handler/https" = ["firefox"];
        "inode/directory" = ["kitty -e ranger"];
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "desktop";
      documents = "documents";
      download = "downloads";
      music = "music";
      pictures = "pictures";
      publicShare = "public";
      templates = "templates";
      videos = "videos";
    };
  };

  gtk = {
    enable = true;
    font.name = "TeX Gyre Adventor 10";
    theme = {
      name = "Juno";
      package = pkgs.juno-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "sloast";
    userEmail = "adaadrobson@gmail.com";

    aliases = {
      amend = "commit --amend";
    };

    extraConfig = {
      color.ui = "true";
      diff.tool = "nvimdiff";
      init.defaultbranch = "master";
      core.pager = "less -iFR";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
