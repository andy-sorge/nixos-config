{ pkgs, lib, ... }:
{
  # vicinae config
  xdg.configFile."vicinae/settings.json".source = ./vicinae.json;

  # zed config
  xdg.configFile."zed/settings.json".source = ./zed.json;
}