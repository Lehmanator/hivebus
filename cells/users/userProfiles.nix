{
  inputs,
  cell,
}: let
  l = inputs.nixpkgs.lib // builtins;
in {
  guangtao.users.users."guangtao" = {
    hashedPassword = "$6$iv9bE8EVny10wamj$CS7uxN8/QeLSIMKZGwN2X2OHKSIY8xxCDrXVkwKokPW4xMGdFGuQ6SSC8UJ9GcUFX2BQizE6k3yv8vUFyH2XA/";
    description = "default";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      # "audio"
      # "video"
    ];
    inherit (cell.secretProfiles.guangtao) openssh;
  };

  root.users.users."root" = {
    hashedPassword = "$6$iv9bE8EVny10wamj$CS7uxN8/QeLSIMKZGwN2X2OHKSIY8xxCDrXVkwKokPW4xMGdFGuQ6SSC8UJ9GcUFX2BQizE6k3yv8vUFyH2XA/";
    inherit (cell.secretProfiles.guangtao) openssh;
  };

  admin.users.users."admin" = {
    uid = 1000;
    description = "default manager";
    hashedPassword = "$6$iv9bE8EVny10wamj$CS7uxN8/QeLSIMKZGwN2X2OHKSIY8xxCDrXVkwKokPW4xMGdFGuQ6SSC8UJ9GcUFX2BQizE6k3yv8vUFyH2XA/";
    isNormalUser = true;
    extraGroups = ["wheel"];
    inherit (cell.secretProfiles.guangtao) openssh;
  };
}
