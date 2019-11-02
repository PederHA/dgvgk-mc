#!/bin/bash

MC_DIR="/minecraft"
SRV_DIR="$MC_DIR/server"
WORLD="DGVGK"

BACKUP_DIR="$MC_DIR/backup"
FILENAME="$WORLD-$(date +%Y-%m-%d-%H%M)"
FPATH="$BACKUP_DIR/$FILENAME"
CHECKSUMFILE="$BACKUP_DIR/checksum.md5"

mkdir -p $BACKUP_DIR

# Create checksum file if it doesn't exist
if [ ! -f $CHECKSUMFILE ]
then
    touch $CHECKSUMFILE
fi

# Create tarball
tar -zcvpf $FPATH.tar --exclude "$SRV_DIR/cache" --exclude "$SRV_DIR/server.jar" --exclude "$SRV_DIR/paper.jar" $SRV_DIR

# Compare checksum of new tarball with previous backup's tarball
CHECKSUM=$((md5sum $FPATH.tar) | cut -d ' ' -f 1)
PREV_CHECKSUM=$(cat $CHECKSUMFILE)

# Exit if tarballs are identical. (No need to consume additional bucket space for identical files)
if [ $CHECKSUM == $PREV_CHECKSUM ]
then
    rm $FPATH.tar
    exit 1
else
    echo $CHECKSUM > $CHECKSUMFILE
fi

# Compress tarball
gzip $FPATH.tar

# Sync compressed tarball with bucket
gsutil cp $FPATH.tar.gz gs://dgvgk-minecraft

# Remove compressed tarball local drive
rm $FPATH.tar.gz
