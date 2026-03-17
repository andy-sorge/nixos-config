{ pkgs, lib, config, ... }:
{
  programs.plasma = {
    enable = true;
    configFile = {
      baloofilerc.General.dbVersion = 2;
      dolphinrc.General.ViewPropsTimestamp = "2026,2,26,10,40,42.393";
      dolphinrc."KFileDialog Settings"."Places Icons Auto-resize" = false;
      dolphinrc."KFileDialog Settings"."Places Icons Static Size" = 22;
      kactivitymanagerdrc.activities.e8495ab9-092a-4fad-8816-b542a2aadbb9 = "Default";
      kcminputrc."Libinput/1267/12693/ELAN0676:00 04F3:3195 Mouse".PointerAccelerationProfile = 2;
      kcminputrc."Libinput/1267/12693/ELAN0676:00 04F3:3195 Touchpad".ClickMethod = 2;
      kcminputrc."Libinput/1267/12693/ELAN0676:00 04F3:3195 Touchpad".NaturalScroll = true;
      kcminputrc."Libinput/2/10/TPPS\\/2 Elan TrackPoint".PointerAccelerationProfile = 1;
      kcminputrc.Mouse.cursorSize = 32;
      kcminputrc.Mouse.cursorTheme = "Capitaine Cursors (Gruvbox)";
      kded5rc.Module-device_automounter.autoload = false;
      kdeglobals.General.TerminalApplication = "kitty";
      kdeglobals.General.TerminalService = "kitty.desktop";
      kdeglobals.General.XftHintStyle = "hintslight";
      kdeglobals.General.XftSubPixel = "none";
      kdeglobals.General.fixed = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.font = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.menuFont = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.smallestReadableFont = "JetBrainsMono Nerd Font,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.General.toolBarFont = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.Icons.Theme = "Gruvbox-Plus-Dark";
      kdeglobals.KDE.contrast = 4;
      kdeglobals.KDE.frameContrast = 0.2;
      kdeglobals."KFileDialog Settings"."Allow Expansion" = false;
      kdeglobals."KFileDialog Settings"."Automatically select filename extension" = true;
      kdeglobals."KFileDialog Settings"."Breadcrumb Navigation" = true;
      kdeglobals."KFileDialog Settings"."Decoration position" = 2;
      kdeglobals."KFileDialog Settings"."Show Full Path" = false;
      kdeglobals."KFileDialog Settings"."Show Inline Previews" = true;
      kdeglobals."KFileDialog Settings"."Show Preview" = false;
      kdeglobals."KFileDialog Settings"."Show Speedbar" = true;
      kdeglobals."KFileDialog Settings"."Show hidden files" = false;
      kdeglobals."KFileDialog Settings"."Sort by" = "Name";
      kdeglobals."KFileDialog Settings"."Sort directories first" = true;
      kdeglobals."KFileDialog Settings"."Sort hidden files last" = false;
      kdeglobals."KFileDialog Settings"."Sort reversed" = false;
      kdeglobals."KFileDialog Settings"."Speedbar Width" = 154;
      kdeglobals."KFileDialog Settings"."View Style" = "DetailTree";
      kdeglobals.WM.activeBackground = "39,39,39";
      kdeglobals.WM.activeBlend = "235,219,178";
      kdeglobals.WM.activeFont = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      kdeglobals.WM.activeForeground = "235,219,178";
      kdeglobals.WM.inactiveBackground = "40,40,40";
      kdeglobals.WM.inactiveBlend = "60,56,54";
      kdeglobals.WM.inactiveForeground = "204,190,155";
      kscreenlockerrc.Daemon.Timeout = 2;
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".Image = "/home/asorge/wallpaper.jpg";
      kscreenlockerrc."Greeter/Wallpaper/org.kde.image/General".PreviewImage =
        "/home/asorge/wallpaper.jpg";
      ksplashrc.KSplash.Theme = "org.kde.breeze.desktop";
      kwalletrc.Wallet."First Use" = false;
      kwinrc.Desktops.Id_1 = "eac510d4-f3c8-40a5-93bd-ee272aab5d12";
      kwinrc.Desktops.Number = 1;
      kwinrc.Desktops.Rows = 1;
      kwinrc.Effect-overview.BorderActivate = 9;
      kwinrc."Tiling/eac510d4-f3c8-40a5-93bd-ee272aab5d12/2de4c667-f816-4355-9029-3caead1a2c81".padding =
        4;
      kwinrc."Tiling/eac510d4-f3c8-40a5-93bd-ee272aab5d12/2de4c667-f816-4355-9029-3caead1a2c81".tiles =
        "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      kwinrc.Xwayland.Scale = 1;
      plasma-localerc.Formats.LANG = "en_US.UTF-8";
      plasmarc.Wallpapers.usersWallpapers = "/home/asorge/wallpaper.jpg";
      spectaclerc.ImageSave.translatedScreenshotsFolder = "Screenshots";
      spectaclerc.VideoSave.translatedScreencastsFolder = "Screencasts";
    };
    dataFile = {

    };
    
    # remove when fixed in plasma-manager
    startup.desktopScript."panels" = {
      text = "";
      preCommands = lib.mkForce ''
        sleep 3
        [ -f ${config.xdg.configHome}/plasma-org.kde.plasma.desktop-appletsrc ] && rm ${config.xdg.configHome}/plasma-org.kde.plasma.desktop-appletsrc
      '';
    };
  };
}
