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
  programs.git = {
    enable = true;
    ignores = [
      "*~"
      ".DS_Store"
      ".git-credentials"
      ".idea/"
      ".vscode/"
      "node_modules/"
    ];
    lfs = {
      enable = true;
    };
    package = pkgs.git;
    settings.user = {
      email = "ponfertato@ya.ru";
      name = "ponfertato";
    };
  };
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "ru"
    ];
    profiles.default = {
      isDefault = true;
      search = {
        enable = true;
        force = true;
        default = "ddg";
        order = [
          "ddg"
          "ya"
          "perplexity"
        ];
        privateDefault = "ddg";
        engines = {
          "ddg" = {
            name = "DuckDuckGo";
            urls = [
              {
                template = "https://duckduckgo.com/";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                  {
                    name = "k1";
                    value = "-1";
                  }
                  {
                    name = "kl";
                    value = "ru-ru";
                  }
                ];
              }
            ];
            icon = "https://duckduckgo.com/favicon.ico";
            definedAliases = [
              "@duckduckgo"
              "@ddg"
            ];
          };
          "ya" = {
            name = "Yandex";
            urls = [
              {
                template = "https://yandex.ru/search/";
                params = [
                  {
                    name = "text";
                    value = "{searchTerms}";
                  }
                  {
                    name = "l10n";
                    value = "ru";
                  }
                  {
                    name = "lr";
                    value = "225";
                  }
                ];
              }
            ];
            icon = "https://yandex.ru/favicon.ico";
            definedAliases = [
              "@yandex"
              "@ya"
            ];
          };
          "perplexity" = {
            name = "Perplexity";
            urls = [
              {
                template = "https://www.perplexity.ai/search/new/";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "https://www.perplexity.ai/favicon.ico";
            definedAliases = [ "@pp" ];
          };
          "bing".metaData.hidden = true;
          "google".metaData.hidden = true;
          "wikipedia-ru".metaData.hidden = true;
        };
      };
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
        "browser.cache.memory.capacity" = 131072;
        "browser.cache.memory.max_entry_size" = 20480;
        "browser.compactmode.show" = true;
        "browser.contentblocking.category" = "strict";
        "browser.discovery.enabled" = false;
        "browser.download.manager.addToRecentDocs" = false;
        "browser.download.open_pdf_attachments_inline" = true;
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.formfill.enable" = false;
        "browser.menu.showViewImageInfo" = true;
        "browser.ml.chat.enabled" = true;
        "browser.ml.chat.menu" = true;
        "browser.ml.chat.provider" = https://chat.potatoenergy.ru;
        "browser.ml.enable" = false;
        "browser.ml.linkPreview.enabled" = false;
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
        "browser.profiles.enabled" = true;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "browser.search.suggest.enabled" = false;
        "browser.search.update" = false;
        "browser.sessionhistory.max_total_viewers" = 4;
        "browser.sessionstore.interval" = 60000;
        "browser.sessionstore.max_tabs_undo" = 10;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.tabs.groups.smart.enabled" = false;
        "browser.uitour.enabled" = false;
        "browser.urlbar.groupLabels.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.trimHttps" = true;
        "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.usage.uploadEnabled" = false;
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_error_page_user_suggestions" = true;
        "editor.truncate_user_pastes" = false;
        "extensions.enabledScopes" = 5;
        "extensions.getAddons.cache.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "findbar.highlightAll" = true;
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.timeout" = 0;
        "general.smoothScroll" = true;
        "general.smoothScroll.currentVelocityWeighting" = 1;
        "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
        "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = 2;
        "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
        "general.smoothScroll.stopDecelerationWeighting" = 1;
        "geo.provider.network.url" = https://beacondb.net/v1/geolocate;
        "gfx.canvas.accelerated.cache-items" = 32768;
        "gfx.canvas.accelerated.cache-size" = 4096;
        "gfx.content.skia-font-cache-size" = 32;
        "gfx.webrender.layer-compositor" = true;
        "image.cache.size" = 10485760;
        "image.mem.decode_bytes_at_a_time" = 65536;
        "layout.word_select.eat_space_to_next_word" = false;
        "media.cache_readahead_limit" = 600;
        "media.cache_resume_threshold" = 300;
        "media.memory_cache_max_size" = 262144;
        "media.memory_caches_combined_limit_kb" = 1048576;
        "mousewheel.default.delta_multiplier_y" = 300;
        "network.IDN_show_punycode" = true;
        "network.auth.subresource-http-auth-allow" = 1;
        "network.dns.disablePrefetch" = true;
        "network.dns.disablePrefetchFromHTTPS" = true;
        "network.dnsCacheEntries" = 10000;
        "network.dnsCacheExpiration" = 3600;
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.enabled" = false;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "network.http.request.max-start-delay" = 5;
        "network.http.speculative-parallel-limit" = 0;
        "network.prefetch-next" = false;
        "network.ssl_tokens_cache_capacity" = 10240;
        "pdfjs.enableScripting" = false;
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "permissions.manager.defaultsUrl" = "";
        "privacy.antitracking.isolateContentScriptResources" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.history.custom" = true;
        "privacy.userContext.ui.enabled" = true;
        "security.OCSP.enabled" = 0;
        "security.csp.reporting.enabled" = false;
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
        "toolkit.telemetry.server" = data:,;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "webgl.max-size" = 16384;
      };
    };
  };
  programs.joplin-desktop = {
    enable = true;
    package = pkgsUnstable.joplin-desktop;
    general.editor = "kate";
    sync = {
      target = "nextcloud";
      interval = "10m";
    };
  };
  programs.lazydocker = {
    enable = true;
    package = pkgsUnstable.lazydocker;
  };
  programs.lazygit = {
    enable = true;
    package = pkgsUnstable.lazygit;
  };
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird;
    profiles.default = {
      isDefault = true;
    };
  };
  home.shellAliases = {
    nix-build = "nix build --impure --no-link .#nixosConfigurations.$(hostname).config.system.build.toplevel";
    nix-gc = "sudo nix-collect-garbage --delete-older-than 3d && sudo nix store optimise";
    nix-hm = "nix run .#homeConfigurations.$(whoami)@$(hostname).activationPackage";
    nix-roll = "sudo nixos-rebuild switch --rollback";
    nix-switch = "sudo nixos-rebuild switch --flake .#$(hostname) --impure";
    nix-sync = ''
      nix flake update > /dev/null && \
      sudo nixos-rebuild switch --flake .#$(hostname) --impure && \
      nix run .#homeConfigurations.$(whoami)@$(hostname).activationPackage
    '';
  };
}
