#!/bin/bash -e

if [ ! -d "${ROOTFS_DIR}" ]; then
	if [ ! -d "${PREV_ROOTFS_DIR}" ]; then
		echo "Previous stage rootfs not found"
		false
	fi
	mkdir -p "${ROOTFS_DIR}"
	rsync -aHAXx --exclude var/cache/apt/archives "${PREV_ROOTFS_DIR}/" "${ROOTFS_DIR}/"
fi

