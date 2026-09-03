{ config, ... }: {
  programs.waybar = {
    enable = true;
    style = ''
      ${builtins.readFile ./style.css}
    '';
    systemd = {
      enable = true;
      # targets = [ config.wayland.systemd.target ];
    };
    settings = {
      mainBar = {
        layer = "top";
        spacing = 6;
        margin-top = 4;
        margin-bottom = 4;
        margin-right = 16;
        margin-left = 16;

        "modules-left" = [
          "custom/icon"
          "idle_inhibitor"
          "group/systray"
        ];
        "modules-center" = [
          "clock"
        ];
        "modules-right" = [
          "network"
          "disk"
          "backlight"
          "custom/memory"
          "pulseaudio"
          "battery"
        ];

        # Modules configuration
        "custom/icon" = {
          format = "<span></span>";
          tooltip = false;
        };

        tray = {
          icon-size = 14;
          spacing = 8;
        };

        disk = {
          format = "<span color='#e78a4e'>  </span>{free} ";
          interval = 60;
          tooltip = false;
        };

        backlight = {
          format = "<span color='#f6c657'> {icon} </span>{percent}% ";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
          tooltip = false;
          reverse-scrolling = true;
        };

        "custom/memory" = {
          exec = "~/.config/waybar/scripts/memory_usage.sh";
          interval = 10;
          return-type = "json";
          format = "<span color='#458588'>  </span>{} ";
        };

        pulseaudio = {
          format = "<span color='#83a598'>  </span>{volume}% ";
          format-muted = "<span color='#ea6962'>  </span>{volume}% ";
          format-bluetooth = "<span color='#83a598'> 󰂰 </span>{volume}% ";
          format-bluetooth-muted = "<span color='#ea6962'> 󰂲 </span>{volume}% ";
          format-source = "{volume}% ";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          tooltip = false;
          max-volume = 130;
          reverse-scrolling = true;
          scroll-step = 2;
        };

        battery = {
          interval = 10;
          states = {
            good = 99;
            warning = 30;
            critical = 20;
          };
          format-icons = {
            default = ["" "" "" "" ""];
          };
          format = "<span color='#689d6a' > {icon} </span>{capacity}% ";
          format-critical = "<span color='#cc241d' > {icon} </span>{capacity}%!! ";
          format-warning = "<span color='#e78a4e' > {icon} </span>{capacity}% ";
          format-full = "<span color='#689d6a' > {icon} </span>{capacity}% ";
          format-charging = "<span color='#689d6a' > 󱐋 </span>{capacity}% ";
          format-charging-warning = "<span color='#e78a4e' > 󱐋 </span>{capacity}% ";
          format-charging-critical = "<span color='#cc241d' > 󱐋 </span>{capacity}% ";
          format-plugged = "<span color='#689d6a' > 󱐋 </span>{capacity}% ";
          format-alt = "<span color='#689d6a' > 󱧥 </span>{time} ";
          tooltip = false;
        };

        network = {
          interval = 2;
          format = "<span color='#ea6962'> 󱘖 </span> Disconnected ";
          format-wifi = "<span color='#ea6962'> {icon} </span>{essid} ";
          format-alt = "<span color='#ea6962'> 󰓅 </span>{bandwidthDownBits} ";
          format-ethernet = "<span color='#ea6962'> 󰈀 </span>{bandwidthDownBits} ";
          format-icons = [ "󰤫" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip-format = "<span color='#ea6962'> 󰩟 </span><span color='#ebdbb2'>{ipaddr}</span> ";
          on-click-right = "impala";
          states = {
            normal = 25;
          };
        };

        clock = {
          timezone = "America/Los_Angeles";
          format = "<span color='#d3869b'>  </span>{:%a %d | %I:%M} ";
          tooltip-format = "<span color='#ebdbb2' background='#282828'>{calendar}</span>";
          interval = 1;
        };

        "custom/tray_arrow" = {
          format = "";
          tooltip = false;
        };

        "group/systray" = {
          drawer = {
            click-to-reveal = true;
            transition-duration = 500;
            transition-left-to-right = false;
          };
          modules = [ "custom/tray_arrow" "tray" ];
          orientation = "horizontal";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰒳 ";
            deactivated = "󰒲 ";
          };
        };
      };
    };
  };
}