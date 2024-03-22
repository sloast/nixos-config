{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Essentials
    git
    gh
    vim
    tmux
    tree
    unzip
    curl
    wget

    # grep
    ripgrep

    # ls
    eza

    # find
    fd
    fzf

    # cat
    bat
    mdcat

    # man
    tldr

    # sh
    zsh

    # top
    unstable.btop

    # other utils
    ncdu

    # neovim
    neovim
    python3Packages.pynvim
    python3Packages.python-lsp-server
    nodePackages.vim-language-server
    #neovide

    # Development
    gcc
    gnumake

    # rust
    rustup

    # java
    openjdk
    jetbrains.idea-community

    # node
    nodejs

    # desktop apps
    kitty
    burpsuite
    unstable.vesktop
    firefox-wayland
    libsForQt5.kdenlive
    vscode
    #spotify

    # audio
    pipewire
    wireplumber

    # screenshot
    grim
    slurp

    # other
    viu
    networkmanagerapplet
    pciutils
    cava
    ffmpeg

    # python
    (python3.withPackages (ps:
      with ps; [
        pywal
        virtualenv
        black
        isort
        pylint
        pytest
      ]))
  ];
}
