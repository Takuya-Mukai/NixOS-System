# home.nix など
{ pkgs, ... }: {

  services.hyprpaper = {
    enable = true;
    settings = {

      # 事前に読み込む壁紙
      preload = [
        "${../modules/config/hypr/backgrounds/Small-memory-sunrise.jpg}"
      ];

      # モニターに壁紙を割り当て
      wallpaper = [
        # "DP-1,/path/to/wallpaper.png" の形式
        # モニター名を空にすると、全てのモニターに適用される
        ",${../modules/config/hypr/backgrounds/Small-memory-sunrise.jpg}"
      ];
    };
  };
}
