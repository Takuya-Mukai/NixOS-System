{ inputs, ... }:

{
  imports = [
    inputs.xremap.nixosModules.default
  ];
  services.xremap = {
    userName = "user";
    serviceMode = "user";
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
