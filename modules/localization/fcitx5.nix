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
  home.sessionVariables = {
    GTK_IM_MODULE= "fcitx";
    QT_IM_MODULE= "fcitx";
    XMODIFIERS= "@im=fcitx";
    INPUT_METHOD= "fcitx";
  };
  home.file = {
    ".local/share/fcitx5/skk/dictionary_list".text = with pkgs; ''
      file=${libskk}/share/skk/SKK-JISYO.L,mode=readonly,type=file
    '';
  };
  xdg.configFile."fcitx5".source = ../config/fcitx5;
}
