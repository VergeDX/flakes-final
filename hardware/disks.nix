{ ... }:
{
  fileSystems = {
    "/" = { fsType = "tmpfs"; options = [ "defaults" "size=2G" "mode=755" ]; };
    "/boot" = { device = "/dev/disk/by-uuid/F80E-3594"; fsType = "vfat"; };
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/41407c27-1829-4cc4-bf34-d4167dabe1e1";
    fsType = "btrfs";
    options = [ "subvol=nix" "noatime" "compress-force=zstd" ];
  };

  fileSystems."/persistent" = {
    device = "/dev/disk/by-uuid/41407c27-1829-4cc4-bf34-d4167dabe1e1";
    fsType = "btrfs";
    options = [ "subvol=persistent" "noatime" "compress-force=zstd" ];
  };
}
