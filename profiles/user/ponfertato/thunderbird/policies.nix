{
  programs.thunderbird.policies = {
    DisableAppUpdate = true;
    DisableTelemetry = true;

    AIControls = {
      Default.Value = "blocked";
    };

    Preferences = {
      "datareporting.healthreport.uploadEnabled" = {
        Value = false;
        Status = "locked";
      };
      "app.update.auto" = {
        Value = false;
        Status = "locked";
      };
      "mail.telemetry_enabled" = {
        Value = false;
        Status = "locked";
      };
    };
  };
}
