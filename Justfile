# Autogenerated! DO NOT EDIT!
# This justfile is autogenerated via https://std.divnix.com/reference/lib/cfg/just.html
# It can be used without Nix by running a locally installed  `just` binary.
# NOTE: Without Nix, you are responsible for having all task dependencies
# available locally!

# edit the key age with ragenix
age cell file:
    ragenix --edit ./cells/{{ cell }}/secretProfiles/{{ file }} --rules ./cells/{{ cell }}/secretProfiles/secrets.nix

# re-age key with ragenix
age-rekey cell:
    ragenix --rules $PRJ_ROOT/secrets.nix --rekey

# build darwin machine
darwin-build machine:
    darwin-rebuild build --flake .#hosts-{{ machine }}

# Colmena build Guangtao Home Machine
desktop action:
    colmena {{ action }} --on hosts-desktop

# Formats all changed source files
fmt:
    treefmt $(git diff --name-only --cached)

# update packages via nvfetcher
node2nix-update:
    cd $PRJ_ROOT/cells/nixos/packages/my-node-packages && sh ./upgrade.sh

# update sources with nvfetcher
nvfetcher path:
    nix develop github:GTrunSec/std-ext#update --refresh --command nvfetcher-update {{ path }}/sources.toml

# update default toolchain with nvfetcher
nvfetcher-default:
    nix develop github:GTrunSec/std-ext#update --refresh --command nvfetcher-update cells/nixos/packages/./sources.toml

# update emacs toolchain with nvfetcher
nvfetcher-emacs:
    nix develop github:GTrunSec/std-ext#update --refresh --command nvfetcher-update cells/nixos/packages/emacs/sources.toml

# update packages via nvfetcher
nvfetcher-update cell:
    nix develop github:GTrunSec/std-ext#devShells.x86_64-linux.update --refresh --command nvfetcher-update ./cells/{{ cell }}/packages/sources.toml
