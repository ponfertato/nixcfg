{
  programs.firefox.policies = {
    AIControls = {
      Default = "available";
      LinkPreviewKeyPoints = "blocked";
      Locked = true;
      PDFAltText = "blocked";
      SidebarChatbot = "available";
      SmartTabGroups = "blocked";
      SmartWindow = "blocked";
      Translations = "available";
    };

    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    DisableAppUpdate = true;
    DisableFirefoxAccounts = false;
    DisableFirefoxScreenshots = true;
    DisableFirefoxStudies = true;
    DisableFormHistory = true;
    DisablePocket = true;
    DisableProfileRefresh = true;
    DisableSafeMode = true;
    DisableTelemetry = true;

    EnableTrackingProtection = {
      Category = "strict";
      Cryptomining = true;
      EmailTracking = true;
      Fingerprinting = true;
      Locked = true;
      SuspectedFingerprinting = true;
      Value = true;
    };

    FirefoxHome = {
      Highlights = true;
      Locked = true;
      Pocket = false;
      Search = true;
      SponsoredStories = false;
      SponsoredTopSites = false;
      Stories = false;
      TopSites = true;
    };

    GenerativeAI = {
      Chatbot = true;
      Enabled = true;
      LinkPreviews = false;
      Locked = true;
      TabGroups = false;
    };

    HttpsOnlyMode = "force_enabled";
    NetworkPrediction = false;
    OfferToSaveLogins = false;
    PasswordManagerEnabled = false;
    PromptForDownloadLocation = true;
    SSLVersionMin = "tls1.2";

    SearchEngines = {
      Default = "DuckDuckGo";
      PreventInstalls = true;
      Add = [
        {
          Name = "DuckDuckGo";
          URLTemplate = "https://duckduckgo.com/?q={searchTerms}&k1=-1&kl=ru-ru";
          IconURL = "https://duckduckgo.com/favicon.ico";
          Alias = "@ddg";
        }
        {
          Name = "Yandex";
          URLTemplate = "https://yandex.ru/search/?text={searchTerms}&l10n=ru&lr=225";
          IconURL = "https://yandex.ru/favicon.ico";
          Alias = "@ya";
        }
        {
          Name = "Perplexity";
          URLTemplate = "https://www.perplexity.ai/search/new/?q={searchTerms}";
          IconURL = "https://www.perplexity.ai/favicon.ico";
          Alias = "@pp";
        }
      ];
      Remove = [
        "bing"
        "google"
        "wikipedia-ru"
      ];
    };

    SearchSuggestEnabled = false;
    StartDownloadsInTempDirectory = true;

    UserMessaging = {
      ExtensionRecommendations = false;
      FeatureRecommendations = false;
      FirefoxLabs = false;
      Locked = true;
      MoreFromMozilla = false;
      SkipOnboarding = true;
      UrlbarInterventions = false;
      WhatsNew = false;
    };

    Preferences = {
      "dom.security.https_only_mode_error_page_user_suggestions" = {
        Value = true;
        Status = "locked";
      };
      "network.IDN_show_punycode" = {
        Value = true;
        Status = "locked";
      };
      "pdfjs.enableScripting" = {
        Value = false;
        Status = "locked";
      };
      "privacy.globalprivacycontrol.enabled" = {
        Value = true;
        Status = "locked";
      };
      "security.csp.reporting.enabled" = {
        Value = false;
        Status = "locked";
      };
      "security.tls.enable_0rtt_data" = {
        Value = false;
        Status = "locked";
      };
    };
  };
}
