{
  programs.firefox.preferences = {
    "browser.compactmode.show" = true;
    "browser.menu.showViewImageInfo" = true;
    "findbar.highlightAll" = true;
    "full-screen-api.transition-duration.enter" = "0 0";
    "full-screen-api.transition-duration.leave" = "0 0";
    "full-screen-api.warning.timeout" = 0;
    "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
    "general.smoothScroll.msdPhysics.enabled" = true;
    "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
    "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
    "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
    "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = 2;
    "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
    "mousewheel.default.delta_multiplier_y" = 300;

    "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
    "network.IDN_show_punycode" = true;
    "network.http.referer.XOriginTrimmingPolicy" = 2;
    "privacy.antitracking.isolateContentScriptResources" = true;
    "privacy.globalprivacycontrol.enabled" = true;
    "privacy.history.custom" = true;
    "privacy.userContext.ui.enabled" = true;
    "security.OCSP.enabled" = 0;
    "security.csp.reporting.enabled" = false;
    "security.ssl.treat_unsafe_negotiation_as_broken" = true;
    "security.tls.enable_0rtt_data" = false;

    "browser.cache.disk.enable" = false;
    "browser.sessionstore.interval" = 60000;
    "gfx.canvas.accelerated.cache-size" = 256;
    "media.memory_cache_max_size" = 65536;

    "browser.ml.chat.enabled" = true;
    "browser.ml.chat.menu" = true;
    "browser.ml.chat.provider" = "https://chat.potatoenergy.ru";
    "browser.ml.enable" = false;
    "browser.ml.linkPreview.enabled" = false;

    "editor.truncate_user_pastes" = false;
    "layout.word_select.eat_space_to_next_word" = false;
    "pdfjs.enableScripting" = false;
    "signon.formlessCapture.enabled" = false;
    "signon.privateBrowsingCapture.enabled" = false;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
}
