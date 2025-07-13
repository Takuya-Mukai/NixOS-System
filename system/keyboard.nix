
{ inputs, ... }:

{
  imports = [
    inputs.xremap.nixosModules.default
  ];
  services.xremap = {
    userName = "your-real-username";  # ← 本当のユーザー名に変更
    serviceMode = "system";
    config = {
      modmap = [
        {
          name = "CapsLock dual Esc/Ctrl";
          remap = {
            CapsLock = {
              # タップ時：Esc、ホールド時：Ctrl
              dual = {
                press = "Esc";
                hold = "Ctrl_L";
              };
            };
          };
        }
      ];
    };
  };
}
