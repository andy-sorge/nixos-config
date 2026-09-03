{ pkgs, ... }:
{
  services.swayidle =
  let
    lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
    
    display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
  
  in
  {
    enable = true;
      timeouts = [
        {
          timeout = 55;
          command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
        }
        {
          timeout = 65;
          command = lock;
        }
        {
          timeout = 60;
          command = display "off";
          resumeCommand = display "on";
        }
        {
          timeout = 180;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = {
        "before-sleep" = (display "off") + "; " + lock;
        "after-resume" = display "on";
        "lock" = (display "off") + "; " + lock;
        "unlock" = display "on";
      };
  };
}