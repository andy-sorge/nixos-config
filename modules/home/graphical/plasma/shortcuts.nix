{ pkgs, ... }:
{
  programs.plasma.shortcuts = {
    ActivityManager.switch-to-activity-e8495ab9-092a-4fad-8816-b542a2aadbb9 = [ ];
    "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
    "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
    kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
    kmix.decrease_microphone_volume = "Microphone Volume Down";
    kmix.decrease_volume = "Volume Down";
    kmix.decrease_volume_small = "Shift+Volume Down";
    kmix.increase_microphone_volume = "Microphone Volume Up";
    kmix.increase_volume = "Volume Up";
    kmix.increase_volume_small = "Shift+Volume Up";
    kmix.mic_mute = [
      "Microphone Mute"
      "Meta+Volume Mute"
    ];
    kmix.mute = "Volume Mute";
    ksmserver."Halt Without Confirmation" = [ ];
    ksmserver."Lock Session" = [
      "Meta+L"
      "Screensaver"
    ];
    ksmserver."Log Out" = "Ctrl+Alt+Del";
    ksmserver."Log Out Without Confirmation" = [ ];
    ksmserver.LogOut = [ ];
    ksmserver.Reboot = [ ];
    ksmserver."Reboot Without Confirmation" = [ ];
    ksmserver."Shut Down" = [ ];
    kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
    kwin."Cycle Overview" = [ ];
    kwin."Cycle Overview Opposite" = [ ];
    kwin."Decrease Opacity" = [ ];
    kwin."Edit Tiles" = "Meta+T";
    kwin.Expose = [
      "Meta+F9"
      "Ctrl+F9"
    ];
    kwin.ExposeAll = [
      "Meta+F10"
      "Launch (C)"
      "Ctrl+F10"
    ];
    kwin.ExposeClass = [
      "Meta+F7"
      "Ctrl+F7"
    ];
    kwin.ExposeClassCurrentDesktop = [ ];
    kwin."Grid View" = "Meta+G";
    kwin."Increase Opacity" = [ ];
    kwin."Kill Window" = "Meta+Ctrl+Esc";
    kwin."Move Tablet to Next LogicalOutput" = [ ];
    kwin.MoveMouseToCenter = "Meta+F6";
    kwin.MoveMouseToFocus = "Meta+F5";
    kwin.MoveZoomDown = [ ];
    kwin.MoveZoomLeft = [ ];
    kwin.MoveZoomRight = [ ];
    kwin.MoveZoomUp = [ ];
    kwin.Overview = "Meta+W";
    kwin."Setup Window Shortcut" = [ ];
    kwin."Show Desktop" = "Meta+D";
    kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
    kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
    kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
    kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
    kwin."Switch Window Down" = "Meta+Alt+Down";
    kwin."Switch Window Left" = "Meta+Alt+Left";
    kwin."Switch Window Right" = "Meta+Alt+Right";
    kwin."Switch Window Up" = "Meta+Alt+Up";
    kwin."Switch to Desktop 1" = [
      "Meta+F1"
      "Ctrl+F1"
    ];
    kwin."Walk Through Windows" = [
      "Meta+Tab"
      "Alt+Tab"
    ];
    kwin."Walk Through Windows (Reverse)" = [
      "Meta+Shift+Tab"
      "Alt+Shift+Tab"
    ];
    kwin."Walk Through Windows Alternative" = [ ];
    kwin."Walk Through Windows Alternative (Reverse)" = [ ];
    kwin."Walk Through Windows of Current Application" = [
      "Meta+`"
      "Alt+`"
    ];
    kwin."Walk Through Windows of Current Application (Reverse)" = [
      "Meta+~"
      "Alt+~"
    ];
    kwin.disableInputCapture = "Meta+Shift+Esc";
    kwin.view_actual_size = "Meta+0";
    kwin.view_zoom_in = [
      "Meta++"
      "Meta+="
    ];
    kwin.view_zoom_out = "Meta+-";
    mediacontrol.mediavolumedown = [ ];
    mediacontrol.mediavolumeup = [ ];
    mediacontrol.nextmedia = "Media Next";
    mediacontrol.pausemedia = "Media Pause";
    mediacontrol.playmedia = [ ];
    mediacontrol.playpausemedia = "Media Play";
    mediacontrol.previousmedia = "Media Previous";
    mediacontrol.seekbackwardmedia = "Media Rewind";
    mediacontrol.seekbackwardmedialong = [ ];
    mediacontrol.seekforwardmedia = "Media Fast Forward";
    mediacontrol.seekforwardmedialong = [ ];
    mediacontrol.stopmedia = "Media Stop";
    org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
    org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
    org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
    org_kde_powerdevil.Hibernate = "Hibernate";
    org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
    org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
    org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
    org_kde_powerdevil.PowerDown = "Power Down";
    org_kde_powerdevil.PowerOff = "Power Off";
    org_kde_powerdevil.Sleep = "Sleep";
    org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
    org_kde_powerdevil."Turn Off Screen" = [ ];
    org_kde_powerdevil.powerProfile = [
      "Battery"
      "Meta+B"
    ];
    plasmashell."Slideshow Wallpaper Next Image" = [ ];
    plasmashell."activate application launcher" = [
      "Meta"
      "Alt+F1"
    ];
    plasmashell."activate task manager entry 1" = "Meta+1";
    plasmashell."activate task manager entry 10" = [ ];
    plasmashell."activate task manager entry 2" = "Meta+2";
    plasmashell."activate task manager entry 3" = "Meta+3";
    plasmashell."activate task manager entry 4" = "Meta+4";
    plasmashell."activate task manager entry 5" = "Meta+5";
    plasmashell."activate task manager entry 6" = "Meta+6";
    plasmashell."activate task manager entry 7" = "Meta+7";
    plasmashell."activate task manager entry 8" = "Meta+8";
    plasmashell."activate task manager entry 9" = "Meta+9";
    plasmashell.clear-history = [ ];
    plasmashell.clipboard_action = "Meta+Ctrl+X";
    plasmashell.cycle-panels = "Meta+Alt+P";
    plasmashell.cycleNextAction = [ ];
    plasmashell.cyclePrevAction = [ ];
    plasmashell.edit_clipboard = [ ];
    plasmashell."manage activities" = "Meta+Q";
    plasmashell."next activity" = "Meta+A";
    plasmashell."previous activity" = "Meta+Shift+A";
    plasmashell.repeat_action = [ ];
    plasmashell."show dashboard" = "Ctrl+F12";
    plasmashell.show-barcode = [ ];
    plasmashell.show-on-mouse-pos = "Meta+V";
    plasmashell."switch to next activity" = [ ];
    plasmashell."switch to previous activity" = [ ];
    plasmashell."toggle do not disturb" = [ ];
    "services/net.local.vicinae.desktop"._launch = "Alt+Space";
    "services/org.kde.krunner.desktop"._launch = [
      "Search"
      "Alt+F2"
    ];
    "services/org.kde.spectacle.desktop".CurrentMonitorScreenShot = [ ];
    "services/org.kde.spectacle.desktop".OpenWithoutScreenshot = [ ];
  };
}
