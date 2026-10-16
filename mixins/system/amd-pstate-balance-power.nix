{...}: {
  services.udev.extraRules = ''
    SUBSYSTEM=="cpu", ACTION=="add", KERNEL=="cpu[0-9]*", ATTR{cpufreq/energy_performance_preference}="balance_power"
  '';
}
