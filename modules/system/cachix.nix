{ config, pkgs, ... }:
let
  cachix-push = pkgs.writeShellScript "cachix-push" ''
    set -eu
    set -f
    export CACHIX_AUTH_TOKEN=$(cat ${config.sops.secrets.cachix-authtoken.path})
    exec ${pkgs.cachix}/bin/cachix push andy-sorge $OUT_PATHS
  '';
in {
  environment.systemPackages = with pkgs; [
    cachix
  ];
  
  nix.settings.post-build-hook = "${cachix-push}";
  sops.secrets.cachix-authtoken = { };
}