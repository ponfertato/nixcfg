{
  programs.thunderbird.policies = {
    CaptivePortal = false;
    DisableAppUpdate = true;

    DisableSecurityBypass = {
      InvalidCertificate = true;
    };

    DisableSystemAddonUpdate = true;
    DisableTelemetry = true;
    InAppNotification_Disabled = true;
    InAppNotification_DonationEnabled = false;
    InAppNotification_MessageEnabled = false;
    InAppNotification_SurveyEnabled = false;
    NetworkPrediction = false;
    OfferToSaveLogins = false;

    PDFjs = {
      Enabled = true;
      EnablePermissions = true;
    };

    PasswordManagerEnabled = false;
    SSLVersionMin = "tls1.2";

    Preferences = {
      "mail.telemetry_enabled" = {
        Value = false;
        Status = "locked";
      };
      "network.IDN_show_punycode" = {
        Value = true;
        Status = "locked";
      };
    };
  };
}
