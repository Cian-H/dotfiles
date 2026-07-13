{
  config,
  pkgs,
  lib,
  ...
}: {
  news.display = "notify";
  home = {
    stateVersion = "23.11";
    username = lib.mkForce (builtins.getEnv "USER");
    homeDirectory = lib.mkForce (builtins.getEnv "HOME");
  };
}
