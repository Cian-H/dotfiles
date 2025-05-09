{
  config,
  pkgs,
  lib,
  ...
}: {
  news.display = "notify";
  home.stateVersion = "23.11";
  home.username = lib.mkForce (builtins.getEnv "USER");
  home.homeDirectory = lib.mkForce (builtins.getEnv "HOME");
}
