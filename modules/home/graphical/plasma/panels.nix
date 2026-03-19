{ pkgs, ... }:
{
  programs.plasma.panels = [
    {
      alignment = "center";
      floating = true;
      height = 46;
      hiding = "none";
      lengthMode = "fill";
      location = "bottom";
      opacity = "adaptive";
      widgets = [
        {
          name = "org.kde.plasma.kickoff";
          config = {
            General = {
              icon = "nix-snowflake";
              alphaSort = true;
            };
          };
        }
        "org.kde.plasma.pager"
        {
          name = "org.kde.plasma.icontasks";
          config = {
            General = {
              launchers = [
                "applications:kitty.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:dev.zed.Zed.desktop"
                "applications:chromium-browser.desktop"
                "applications:spotify.desktop"
                "applications:legcord.desktop"
              ];
            };
          };
        }
        "org.kde.plasma.marginsseparator"
        "org.kde.plasma.systemtray"
        "org.kde.plasma.digitalclock"
        "org.kde.plasma.showdesktop"
      ];
    }
  ];
}
