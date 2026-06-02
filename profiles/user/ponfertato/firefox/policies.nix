{
  programs.firefox.policies = {
    DisableAppUpdate = true;
    DisableFirefoxStudies = true;
    DisableTelemetry = true;

    EnableTrackingProtection = {
      Category = "strict";
      Cryptomining = true;
      EmailTracking = true;
      Fingerprinting = true;
      Locked = true;
      Value = true;
    };

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

    AIControls = {
      Default.Value = "blocked";
      LinkPreviews.Value = "blocked";
      SidebarChatbot.Value = "blocked";
    };

    UserMessaging = {
      ExtensionRecommendations = false;
      FeatureRecommendations = false;
      MoreFromMozilla = false;
      SkipOnboarding = true;
    };
  };
}
