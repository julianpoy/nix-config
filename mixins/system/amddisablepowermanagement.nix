{
  config,
  pkgs,
  ...
}: {
  boot.kernelParams = [
    "amdgpu.ppfeaturemask=0xf7fff" # disable "PP_GFXOFF_MASK" dynamic graphics engine     
    "amdgpu.aspm=0" # disable pcie active state power management
    "amdgpu.bapm=0" # disable bidirectional application CPU/GPU TDP power management
    "amdgpu.runpm=0" # disable runtime power management
    "pcie_aspm=off" # disable active state power management
  ];
}
