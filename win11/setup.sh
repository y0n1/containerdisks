#!/usr/bin/env bash

function get_script_path {
    realpath "${BASH_SOURCE[0]}"
}

function get_file_name {
    find iso -type f -iname "*.iso" -exec basename -s .iso {} \;  | tail -1
}

function convert {
    local iso_dir
    local out_dir
    

    if [[ -n "$(command -v qemu-img)" ]]; then
        iso_dir="$(dirname "$(get_script_path)")/iso"
        out_dir="$(dirname "$(get_script_path)")/disk"

        echo -n "Converting ISO to QCOW2"
        qemu-img convert \
            -p \
            -f raw \
            -O qcow2 \
            "$iso_dir/$(get_file_name).iso" \
            "$out_dir/$(get_file_name).qcow2"
    else
        echo "Command qemu-img not found, did you install qemu?"
    fi
}

"$@"
