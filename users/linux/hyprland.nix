{ inputs, pkgs, ...}:
{
  programs.hyprlock.enable = true;
  services = {
    hypridle.enable =true;
    hyprpaper.enable = true;
    hyprpolkitagent.enable = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprfocus
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    settings = {
      # 変数定義
      "$terminal" = "foot";
      "$fileManager" = "thunar";
      "$menu" = "sherlock";
      "$browser" = "zen-browser";
      "$mainMod" = "SUPER";

      # モニター設定
      # NOTE: この`source`行は機能しません。`monitor.conf`の内容を別途Nixで管理してください。
      # source = "${config.home.homeDirectory}/.config/hypr/monitor.conf";

      # 自動起動
      exec-once = [
        "hyprpaper"
        ${../modules/config/hypr/scripts/desktop-portal.sh}
        "udiskie"
        "fcitx5"
        "copyq"
        "workstyle &> /tmp/workstyle.log"
        "systemctl --user start hyprpolkitagent"
        ${../modules/config/hypr/scripts/optimize4ExitNode.sh}
        "nm-applet --sm-disable &"
        "nextcloud --background"
        ${../modules/config/hypr/scripts/start.sh}
        # NOTE: プラグインは`programs.hyprland.plugins`で指定するため、以下の行は不要です。
        # "hyprctl plugin load \"$HYPR_PLUGIN_DIR/lib/libhyprfocus.so\""
      ];

      # 環境変数
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # パーミッション
      permission = [
        "/usr/(bin|local/bin)/grim, screencopy, allow"
        "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow"
        "/usr/(bin|local/bin)/hyprpm, plugin, allow"
      ];

      # 外観 (General)
      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 2;
        "col.active_border" = "rgba(2892c2aa) rgba(2850c2aa) 90deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      # 外観 (Decoration)
      decoration = {
        rounding = 8;
        # "rounding_power" は存在しないオプションの可能性があります
        # rounding_power = 8;

        active_opacity = 1.0;
        inactive_opacity = 0.95;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # アニメーション
      animations = {
        enabled = true; # "yes, please :)" の代わりに `true` を使用
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # プラグイン設定
      plugin = {
        hyprfocus = {
          enabled = true;
          mode = "bounce";
          bounce_strength = 0.98;
        };
      };

      # レイアウト
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      # 入力設定
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      # デバイス固有設定
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      # キーバインド
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, T, togglesplit,"
        "$mainMod CTRL, L, exec, hyprlock"
        "$mainMod, W, exec, $browser"
        "$mainMod, F, fullscreen"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod SHIFT, T, exec, ${../modules/config/hypr/scripts/translate.sh}"
        "$mainMod SHIFT, W, exec, ${../modules/config/hypr/scripts/wiki.sh}"
        "$mainMod, E, overview:toggle"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # ウィンドウ ルール
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      windowrulev2 = [
        "opacity 0.95, class:^(kitty)$"
        "float, title:^(Network Connection)$"
        "center, title:^(Network Connection)$"
        "float, title:^(Floating Window - Show Me The Key)$"
        "float, title:^(clipse)$"
        "center, title:^(clipse)$"
        "size 50% 80%, title:^(clipse)$"
        "float, class:^(Thunar)$"
        "size 60% 70%, class:^(Thunar)$"
        "float, class:^(blueman-manager)$"
        "float, class:^(pavucontrol)$"
        "move 70% 0%, class:^(pavucontrol)$"
        "workspace special, class:^(obsidian)$"
        "float, title:^(pop-up)$"
        "float, title:^(bubble)$"
        "float, title:^(dialog)$"
        "float, title:^(dialog)$"
        "float, title:^(task_dialog)$"
        "float, title:^(menu)$"
        "float, title:^(floating)$"
        "float, title:^(floating_update)$"
        "size 1000 600, title:^(floating_update)$"
        "float, class:^(pinentry)$"
        "float, title:^(Administrator privileges required)$"
        "float, title:^(Extension:)$"
        "float, title:^(About Mozilla Firefox)$"
        "float, title:^(About)$"
        "float, title:^(Library)$"
        "float, title:^(Pomodorolm)$"
        "float, class:^(=terminal_shutdown)$"
        "size 18% 10%, title:^(=terminal_shutdown)$"
        "center, class:^(=terminal_shutdown)$"
        "float, class:^(=translation_kitty)$"
        "size 35% 70%, title:^(=translation_kitty)$"
        "center, class:^(=translation_kitty)$"
        "float, class:^(=select_language)$"
        "size 17% 10%, class:^(=select_language)$"
        "center, class:^(=select_language)$"
        "float, title:^(=floating-study-terminal)$"
        "center, title:^(=floating-study-terminal)$"
        "size 30% 30%, title:^(=floating-study-terminal)$"
        "tile, class:^(Google-chrome)$, title:^(Messenger)$"
        "float, title:^(launcher)$"
        "center, title:^(launcher)$"
        "float, class:^(com.github.hluk.copyq)$"
        "float, initialClass:^(=terminal-btop)$"
      ];
    };
  };
}
