#!/usr/bin/env bash
set -euo pipefail

KEYBOARD=splitkb/aurora/lily58/rev1
QMK_REPO=${QMK_REPO:-https://github.com/vial-kb/vial-qmk.git}
QMK_BRANCH=vial
WORK_DIR=${WORK_DIR:-./.work}
UF2=splitkb_aurora_lily58_rev1_vial_liatris.uf2

cd "$(dirname "$0")"

if [ ! -d "$WORK_DIR/.git" ]; then
    git clone --depth 1 --branch "$QMK_BRANCH" "$QMK_REPO" "$WORK_DIR"
fi

cp custom/keyboard.json "$WORK_DIR/keyboards/splitkb/aurora/lily58/rev1/keyboard.json"
cp -R custom/keymaps/. "$WORK_DIR/keyboards/splitkb/aurora/lily58/rev1/keymaps/"

make -C "$WORK_DIR" "$KEYBOARD:vial" \
    CONVERT_TO=liatris \
    ENCODER_ENABLE=no

mkdir -p firmware
cp "$WORK_DIR/$UF2" firmware/
echo "Done: firmware/$UF2"