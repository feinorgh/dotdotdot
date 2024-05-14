#!/bin/bash

install_from_iso() {
    local ISO_FILE PRESEED_FILE
    ISO_FILE="../os-images/debian-12.5.0-amd64-netinst.iso"
    PRESEED_FILE="../os/debian/preseed.cfg"
    virt-install --connect qemu:///system \
        --name debian12 \
        --location "$ISO_FILE" \
        --os-variant debian12 \
        --network bridge=virbr0,model=virtio \
        --initrd-inject="$PRESEED_FILE"
}

main() {
    install_from_iso
}

main "$@"
