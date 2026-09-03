{ ... }:
{
  virtualisation.docker = {
    enable = true;
    daemon.settings.features.cdi = true;
  };

  users.users.andy.extraGroups = [ "docker" ];
}