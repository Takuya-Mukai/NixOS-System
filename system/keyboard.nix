
{ config, inputs, pkgs, ... }:

{
  imports =
    [
      inputs.xremap.nixosModules.default
    ];

  services.xremap = {
    userName = "user";
    serviceMode = "system";
    config = {
      modmap = [
        {
          name = "CapsLock to Esc";
          remap = { CapsLock = "Esc"; };
        }
        {
          name = "CapsLock to Ctrl";
          remap = { CapsLock = "Ctrl_L"; };
        }
      ];
    };
  };
}
