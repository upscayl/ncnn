#!/bin/bash

# Get argument for platform
PLATFORM=$1
# Get argument for folder or file upscale
TYPE=$2

BIN_PATH="time build-$PLATFORM/upscayl-bin"
# Check if type is folder or file
if [ $TYPE = "file" ]; then
		ADDITIONAL_ARGS="-i images/input2.jpg -o test.jpg -s 4 -m models/ -n realesrgan-x4plus"
elif [ $TYPE = "folder" ]; then
		ADDITIONAL_ARGS="-i images/ -o images_out/ -s 4 -m models/ -n realesrgan-x4plus"
fi

# Run upscayl-bin
$BIN_PATH $ADDITIONAL_ARGS