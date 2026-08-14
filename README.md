# lilly58-firmware

Custom Vial firmware for Aurora Lily58 rev1 (Liatris RP2040).

- Left C0 physically rerouted to C6 (B5 damaged). Encoder disabled.
- Power LEDs off after boot.

## Build

    ./build.sh   # needs a working QMK toolchain (https://docs.qmk.fm/newbs_getting_started)

Output: `firmware/splitkb_aurora_lily58_rev1_vial_liatris.uf2`

## Flash

- Same UF2 on BOTH halves.
- TRRS disconnected while flashing.
- Hold BOOT, plug in, drag UF2 to drive.