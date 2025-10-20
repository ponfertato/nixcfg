{
  config,
  inputs,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  home.homeDirectory = "/home/ponfertato";
  home.stateVersion = "25.05";
  home.username = "ponfertato";
  programs.bash.enable = true;
  home.packages = with pkgs; [
    android-tools
    corefonts
    gimp
    git
    kdePackages.kate
    kdePackages.tokodon
    krita
    libreoffice
    pkgsUnstable.joplin-desktop
    pkgsUnstable.keepassxc
    pkgsUnstable.lazydocker
    pkgsUnstable.lazygit
    pkgsUnstable.nextcloud-client
    pkgsUnstable.nextcloud-talk-desktop
    pkgsUnstable.telegram-desktop
    pkgsUnstable.vscodium
    qbittorrent
    remmina
    thunderbird
    vlc
  ];
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "ru"
    ];
    profiles.default = {
      isDefault = true;
      settings = {
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "apz.overscroll.enabled" = true;
        "breakpad.reportURL" = "";
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "browser.bookmarks.openInTabClosesMenu" = false;
        "browser.cache.disk.enable" = false;
        "browser.compactmode.show" = true;
        "browser.contentblocking.category" = "strict";
        "browser.discovery.enabled" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.open_pdf_attachments_inline" = true;
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.formfill.enable" = false;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.menu.showViewImageInfo" = true;
        "browser.ml.chat.provider" = "https://chat.potatoenergy.ru";
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.places.speculativeConnect.enabled" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.privateWindowSeparation.enabled" = false;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.privatebrowsing.resetPBM.enabled" = true;
        "browser.privatebrowsing.vpnpromourl" = "";
        "browser.profiles.enabled" = true;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "browser.search.suggest.enabled" = false;
        "browser.search.update" = false;
        "browser.sessionhistory.max_total_viewers" = 4;
        "browser.sessionstore.interval" = 60000;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.uitour.enabled" = false;
        "browser.urlbar.groupLabels.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.unitConversion.enabled" = true;
        "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "content.notify.interval" = 100000;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.usage.uploadEnabled" = false;
        "editor.truncate_user_pastes" = false;
        "extensions.enabledScopes" = 5;
        "extensions.getAddons.cache.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.enabled" = false;
        "findbar.highlightAll" = true;
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.timeout" = 0;
        "general.smoothScroll" = true;
        "general.smoothScroll.currentVelocityWeighting" = "1";
        "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
        "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = "2";
        "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
        "general.smoothScroll.stopDecelerationWeighting" = "1";
        "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;
        "image.mem.decode_bytes_at_a_time" = 32768;
        "layout.css.grid-template-masonry-value.enabled" = true;
        "layout.word_select.eat_space_to_next_word" = false;
        "media.cache_readahead_limit" = 7200;
        "media.cache_resume_threshold" = 3600;
        "media.memory_cache_max_size" = 65536;
        "mousewheel.default.delta_multiplier_y" = 300;
        "network.IDN_show_punycode" = true;
        "network.auth.subresource-http-auth-allow" = 1;
        "network.dns.disablePrefetch" = true;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "network.dnsCacheExpiration" = 3600;
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.enabled" = false;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "network.http.speculative-parallel-limit" = 0;
        "network.predictor.enabled" = false;
        "network.prefetch-next" = false;
        "network.ssl_tokens_cache_capacity" = 10240;
        "pdfjs.enableScripting" = false;
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "permissions.manager.defaultsUrl" = "";
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.history.custom" = true;
        "privacy.trackingprotection.allow_list.baseline.enabled" = true;
        "privacy.trackingprotection.allow_list.convenience.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        "security.OCSP.enabled" = 0;
        "security.csp.reporting.enabled" = false;
        "security.mixed_content.block_display_content" = true;
        "security.pki.crlite_mode" = 2;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "security.tls.enable_0rtt_data" = false;
        "signon.formlessCapture.enabled" = false;
        "signon.privateBrowsingCapture.enabled" = false;
        "toolkit.coverage.endpoint.base" = "";
        "toolkit.coverage.opt-out" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
      };
    };
  };
  home.shellAliases = {
    nix-update-inputs = "nix flake update --flake path:.";
    nix-apply-system = ''
      sudo nixos-generate-config && sudo nixos-rebuild switch --flake "path:.#$(hostname)" --impure
    '';
    nix-apply-user = ''
      nix --extra-experimental-features 'nix-command flakes' \
         run "path:.#homeConfigurations.ponfertato@$(hostname).activationPackage"
    '';
    nix-gc = "nix-collect-garbage --delete-older-than 3d && nix store optimise";
    nix-search = "nix search nixpkgs";
    nix-search-unstable = "nix search nixpkgs-unstable";
    nix-edit = ''
      cd "$NIXCFG_PATH" && ${pkgs.git}/bin/git status
    '';
  };
}
