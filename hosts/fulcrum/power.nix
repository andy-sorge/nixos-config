{ pkgs, lib, ... }:
{
  boot.kernelParams = [
    # make sure amd performance scaling driver enabled
    "amd_pstate=active"
  ];

  # default nixos sleep/hibernate manager
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "powersave";
  };

  # configurable power manager service
  services.tlp = {
    enable = true;
    settings = {
      # cpu plans
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # ram
      MEM_SLEEP_ON_AC = "s2idle";
      MEM_SLEEP_ON_BAT = "deep";

      # acpi
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      # pcie
      PCIE_ASPM_ON_BAT = "powersupersave";

      # nvme
      AHCI_RUNTIME_PM_ON_BAT = "auto";

      # usb
      USB_AUTOSUSPEND = 1;

      # radio
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";
    };
  };

  # block if plasma enables, conflicts with tlp
  services.power-profiles-daemon.enable = lib.mkForce false;

  services = {
    gvfs.enable = true;
    upower.enable = true;

    fprintd.enable = true;
    fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    bluez
  ];
}
