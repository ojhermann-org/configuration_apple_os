{ pkgs, lib, ... }:

let
  gst        = pkgs.writeShellScriptBin "gst"        (builtins.readFile ./shell/scripts/gst.sh);
  newPyDir   = pkgs.writeShellScriptBin "new-py-dir" (builtins.readFile ./shell/scripts/new-py-dir.sh);
  newZsh     = pkgs.writeShellScriptBin "new-zsh"    (builtins.readFile ./shell/scripts/new-zsh.sh);
  newBash    = pkgs.writeShellScriptBin "new-bash"   (builtins.readFile ./shell/scripts/new-bash.sh);
  watchDir   = pkgs.writeShellScriptBin "watch-dir"  (builtins.readFile ./shell/scripts/watch-dir.sh);

  commonAliases = {
    date = "date +'%Y-%m-%d %H:%M:%S'";
    grep = "grep -i --color=auto";
    gs = "git status -sb";
    ls = "ls --color=auto";
    tree = "tree -aC";
    zj = "zellij";
  };
in
{
  home.packages = [ pkgs.coreutils gst newPyDir newZsh newBash watchDir ];

  home.activation.sudoByTouch = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin (
    lib.hm.dag.entryAfter [ "writeBoundary" ] (builtins.readFile ./shell/scripts/sudo-by-touch.sh)
  );

  programs.zsh = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    enable = true;
    history = {
      size = 200;
      ignoreDups = true;
    };
    shellAliases = commonAliases;
    initExtra = builtins.readFile ./shell/scripts/zsh-init.sh;
  };

  programs.bash = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    enable = true;
    historySize = 200;
    historyControl = [ "ignoredups" ];
    shellAliases = commonAliases;
    initExtra = builtins.readFile ./shell/scripts/bash-init.sh;
  };
}
