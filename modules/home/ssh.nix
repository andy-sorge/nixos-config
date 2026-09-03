{ pkgs, ... }:
{
  services.ssh-agent.enable = true;
  
  programs.ssh = {
    settings."fulcrum" = {
      AddKeysToAgent = "yes";
      IdentityFile = "/home/andy/.ssh/fulcrum";
    };
    settings = {
      ForwardAgent = "yes";
    };
  };
}