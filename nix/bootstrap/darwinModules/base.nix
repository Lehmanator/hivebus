{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zstd
  ];
}
