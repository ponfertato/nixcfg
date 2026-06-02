{ pkgs, ... }:
{
  imports = [
    ./firefox/policies.nix
    ./firefox/preferences.nix
    ./thunderbird/policies.nix
    ./thunderbird/preferences.nix
  ];

  users.users.ponfertato = {
    isNormalUser = true;
    description = "ponfertato";
    extraGroups = [
      "adbusers"
      "audio"
      "cups"
      "docker"
      "flatpak"
      "gamemode"
      "input"
      "libvirt"
      "networkmanager"
      "plugdev"
      "scanner"
      "sshd"
      "video"
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
    corefonts
    curl
    gimp
    git
    kdePackages.kate
    kdePackages.tokodon
    krita
    lazygit
    libreoffice
    nano
    qbittorrent
    remmina
    thunderbird
    unstable.joplin-desktop
    unstable.keepassxc
    unstable.lazydocker
    unstable.nextcloud-client
    unstable.nextcloud-talk-desktop
    unstable.telegram-desktop
    unstable.v2rayn
    unstable.vscodium
    vlc
    wget
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      user = {
        name = "ponfertato";
        email = "ponfertato@ya.ru";
      };
      core = {
        excludesFile = "/etc/gitignore_global";
      };
    };
  };

  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "ru"
    ];
  };

  programs.thunderbird.enable = true;

  programs.bash.shellAliases = {
    nix-check = "nix flake check";
    nix-gc = "sudo nix-collect-garbage -d && sudo nix store optimise";
    nix-roll = "sudo nixos-rebuild switch --rollback";
    nix-switch = "sudo nixos-rebuild switch --flake .#$(hostname) --impure";
    nix-update = "nix flake update";
    ll = "ls -lah";
    la = "ls -A";
    .. = "cd ..";
    ... = "cd ../..";
    gs = "git status";
    gl = "git log --oneline --graph";
    gp = "git pull --rebase";
  };

  programs.kdeconnect.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };
}
