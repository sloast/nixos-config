{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # essentials
    git
    gh
    vim
    #tmux
    tree
    unzip
    curl
    wget

    # improved tools
    ripgrep
    fd
    fzf
    lsd
    ncdu
    bat
    mdcat
    jq
    unstable.btop
    tldr

    # currently unused
    noti
    ripgrep-all
    eza
    nnn
    sd
    z-lua
    #blesh
    #byobu # why not use wm?
    delta
    du-dust

    # shell
    zsh

    # neovim
    neovim
    nodePackages.vim-language-server
    universal-ctags
    unstable.neovide

    # Development
    gcc
    gnumake
    nodejs
    rustup
    openjdk

    # desktop apps
    kitty
    burpsuite
    unstable.vesktop
    firefox-wayland
    libsForQt5.kdenlive
    vscode
    unstable.jetbrains.idea-community
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
    nix-output-monitor

    # python
    (python3.withPackages (ps:
      with ps; [
        pynvim
        python-lsp-server

        pywal
        virtualenv
        black
        isort
        pylint
        pytest
      ]))
  ];
}
