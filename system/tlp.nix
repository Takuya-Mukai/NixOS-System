{ config, pkgs, inputs, ...}:
{
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
    # make everything as power-efficient as possible
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";

      CPU_MIN_PREF_ON_AC = 0;
      CPU_MAX_PREF_ON_AC = 100;
      CPU_MIN_PREF_ON_BAT = 0;
      CPU_MAX_PREF_ON_BAT = 20;

      CPU_BOOST_ON_BAT = 0;
      CPU_BOOST_ON_AC = 0;
      WIFI_PWR_ON_BAT = 1;
      WIFI_PWR_ON_AC = 1;
    };
  };
}
