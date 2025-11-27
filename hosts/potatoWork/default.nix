{
  config,
  inputs,
  pkgs,
  ...
}:
{
  networking.hostName = "potatoWork";

  boot.kernelParams = [
    "acpi=strict"
    "i915.enable_fbc=1"
    "i915.enable_guc=2"
    "i915.enable_psr=2"
    "i915.perf_stream_paranoid=0"
    "intel_idle.max_cstate=4"
    "intel_pstate=active"
    "loglevel=3"
    "pci=noacpi"
    "processor.max_cstate=4"
    "quiet"
    "splash"
    "video=VGA-1:1600x900@60"
  ];

  boot.kernel.sysctl = {
    "dev.i915.perf_stream_paranoid" = 0;
    "kernel.acpi_sci" = "edge";
    "kernel.perf_event_paranoid" = 1;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 15;
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };

  hardware.cpu.intel.updateMicrocode = true;
}
