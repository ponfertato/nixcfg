{ pkgs, ... }:
{
  imports = [
    ./firefox
    ./neovim
    ./thunderbird
  ];

  users.users.ponfertato = {
    isNormalUser = true;
    description = "ponfertato";
    extraGroups = [
      "adbusers"
      "cups"
      "docker"
      "gamemode"
      "kvm"
      "libvirt"
      "networkmanager"
      "plugdev"
      "scanner"
      "wheel"
    ];
  };

  environment.etc."gitignore_global".text = ''
    *~
    .DS_Store
    .git-credentials
    .idea/
    .vscode/
    node_modules/
  '';

  environment.systemPackages = with pkgs; [
    android-tools
    appimage-run
    audacity
    curl
    exfat
    exfatprogs
    gimp
    git
    git-credential-oauth
    krita
    libreoffice
    qbittorrent
    remmina
    thunderbird
    vlc
    wget
    kdePackages.kate
    kdePackages.partitionmanager
    kdePackages.tokodon
    unstable.joplin-desktop
    unstable.keepassxc
    unstable.lazydocker
    unstable.lazygit
    unstable.nextcloud-client
    unstable.nextcloud-talk-desktop
    unstable.telegram-desktop
    unstable.v2rayn
    unstable.vscodium
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      alias = {
        br = "branch";
        ci = "commit";
        co = "checkout";
        lg = "log --oneline --graph --decorate";
        st = "status";
      };
      color = {
        ui = "auto";
      };
      core = {
        autocrlf = "input";
        editor = "nvim";
        whitespace = "trailing-space,space-before-tab";
      };
      credential = {
        helper = "oauth";
      };
      diff = {
        algorithm = "histogram";
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        conflictstyle = "zdiff3";
      };
      pull = {
        rebase = true;
      };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      user = {
        name = "ponfertato";
        email = "ponfertato@ya.ru";
      };
    };
  };

  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "ru"
    ];
    nativeMessagingHosts.packages = [
      pkgs.kdePackages.plasma-browser-integration
    ];
  };

  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
    # withNodeJs = true;
  };

  programs.thunderbird.enable = true;
  programs.bash.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    gl = "git lg";
    gs = "git st";
    la = "ls -A";
    ll = "ls -lah";
    nix-check = "nix flake check";
    nix-gc = "sudo nix-collect-garbage -d && sudo nix store optimise";
    nix-roll = "sudo nixos-rebuild switch --rollback";
    nix-switch = "sudo nixos-rebuild switch --flake .#$(hostname) --impure";
    nix-update = "nix flake update";
  };

  programs.kdeconnect.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };
}
