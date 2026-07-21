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
        position = "top";
        height = 36;
        spacing = 0;
        modules-left = [
          "custom/icon"
          "clock"
          "idle_inhibitor"
        ];
        modules-center = [ ];
        modules-right = [
          "group/systray"
          "backlight"
          "wireplumber"
          "battery"
          "network"
        ];

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        "wireplumber" = {
          format = "󰕾 {volume}%";
          format-muted = "󰖁 <s>{volume}%</s>";
        };

        "network" = {
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈀 Ethernet";
          format-disconnected = "󰲜 Disconnected";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          tooltip-format = "{ifname} via {gwaddr}\nIP: {ipaddr}/{cidr}";
        };

        "custom/icon" = {
          format = "";
          tooltip = false;
        };
        
        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
          tooltip = false;
        };

        "clock" = {
          format = "󰥔 {:%I:%M}";
          format-alt = "󰃭 {:%d.%m.%Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰈉";
            deactivated = "󰈈";
          };
        };

        "custom/tray_arrow" = {
          format = "";
        };
        "group/systray" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
            click-to-reveal = true;
          };
          modules = [ "custom/tray_arrow" "tray" ];
        };
        "tray" = {
          icon-size = 18;
          spacing = 10;
        };
      };
    };
  };
}
