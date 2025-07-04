{ config, pkgs, ...}:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-skk
      ];
      waylandFrontend = true;

      settings = {
        globalOptions = {
          "Hotkey" = {
            "EnumerateWithTriggerKeys" = "True";
            # "TriggerKeys"."0" = "Control+space";
            # "EnumerateGroupForwardKeys"."0" = "Super+space";
          };
          "Behavior" = {
            "ShareInputState" = "Program";
            "PreeditEnabledByDefault" = "True";
            "ShowInputMethodInformation" = "True";
            "showInputMethodInformationWhenFocusIn" = "True";
            "CompactInputMethodInformation" = "True";
            "ShowFirstInputMethodInformation" = "True";
            "DefaultPageSize" = "6";
          };
        };
        inputMethod = {
          "GroupOrder"."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us"; # ★ 修正: ここを "us" に合わせる ★
            DefaultIM = "skk";      # ここは変わらず "skk"
          };

          # "Groups/0/Items/0" はキーボードレイアウト
          "Groups/0/Items/0".Name = "keyboard-us"; # ★ 修正: ここを "keyboard-us" に合わせる ★
          "Groups/0/Items/0".Layout = ""; # Layout は空文字列でOK (profileと同じ)

          # "Groups/0/Items/1" は SKK
          "Groups/0/Items/1".Name = "skk"; # ここは変わらず "skk"
          "Groups/0/Items/1".Layout = "";  # Layout は空文字列でOK (profileと同じ)
        };
      };
    };
  };
}
