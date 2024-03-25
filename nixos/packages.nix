{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # essentials
    git
    gh
    vim
    tmux
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
    trash-cli

    ueberzug

    # currently unused
    noti
    ripgrep-all
    eza
    #nnn
    sd
    z-lua
    #blesh
    #byobu # why not use wm?
    delta
    du-dust

    # terminals (for testing)
    alacritty
    st
    termite
    wezterm
    #warp-terminal
    foot

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
    burpsuite
    unstable.vesktop
    firefox-wayland
    libsForQt5.kdenlive
    vscode
    #jetbrains.idea-community
    #spotify
    imv
    unstable.obsidian
    gparted

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

    (ranger.overrideAttrs
      (r: {
        preConfigure =
          r.preConfigure
          + ''
            # Specify path to Überzug
            substituteInPlace ranger/ext/img_display.py \
              --replace "Popen(['ueberzug'" \
                        "Popen(['${pkgs.ueberzug}/bin/ueberzug'"

            # Use Überzug as the default method
            substituteInPlace ranger/config/rc.conf \
              --replace 'set preview_images_method w3m' \
                        'set preview_images_method kitty'
          '';
      }))
  ];
}
