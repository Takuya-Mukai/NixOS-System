{ config, pkgs, ...}:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-skk
        kdePackages.fcitx5-qt
        libskk
        fcitx5-tokyonight
      ];
      waylandFrontend = true;
    };
  };
  home.file = {
    ".xprofile".text = ''
      export GTK_IM_MODULE=fcitx
      export QT_IM_MODULE=fcitx
      export XMODIFIERS=@im=fcitx
    '';
    ".local/share/fcitx5/skk/dictionary_list".text = with pkgs; ''
      file=${libskk}/share/skk/SKK-JISYO.L,mode=readonly,type=file
    '';
    # ".config/fcitx5" = {
    #   source = ./fcitx5;
    #   recursive = true;
    # };
  };
}
