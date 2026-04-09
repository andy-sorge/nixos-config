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
          timeout = 120;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = [
        {
          event = "before-sleep";
          # adding duplicated entries for the same event may not work
          command = (display "off") + "; " + lock;
        }
        {
          event = "after-resume";
          command = display "on";
        }
        {
          event = "lock";
          command = (display "off") + "; " + lock;
        }
        {
          event = "unlock";
          command = display "on";
        }
      ];
  };
}