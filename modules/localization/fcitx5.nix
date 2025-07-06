{ config, pkgs, ...}:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-skk
        kdePackages.fcitx5-qt
	libsForQt5.fcitx5-qt
        libskk
        fcitx5-tokyonight
      ];
      waylandFrontend = true;
    };
  };
  home.file = {
    ".config/environment.d/99-fcitx.conf".text = ''
      GTK_IM_MODULE=fcitx
      QT_IM_MODULE=fcitx
      XMODIFIERS=@im=fcitx
      INPUT_METHOD=fcitx
    '';
    ".local/share/fcitx5/skk/dictionary_list".text = with pkgs; ''
      file=${libskk}/share/skk/SKK-JISYO.L,mode=readonly,type=file
    '';
    ".config/fcitx5" = {
      source = ../config/fcitx5;
      recursive = true;
    };
  };
}
