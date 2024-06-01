#!/bin/bash

# Get argument for platform
PLATFORM=$1
# Get argument for folder or file upscale
TYPE=$2
BUILD=$3

if [ $BUILD == "build" ]; then
	./build.sh $PLATFORM
fi

if [ $PLATFORM == "arm64" ]; then
	BIN_PATH="time build-$PLATFORM/upscayl-bin"
else
	BIN_PATH="time build/upscayl-bin"
fi

# Check if type is folder or file
if [ $TYPE = "file" ]; then
		ADDITIONAL_ARGS="-i ./images/ -o ./output/ -w 1020 -m models/ -n realesrgan-x4plus -c 0"
elif [ $TYPE = "folder" ]; then
		ADDITIONAL_ARGS="-i images/ -o images_out/ -s 4 -m models/ -n realesrgan-x4plus"
fi

# Run upscayl-bin
$BIN_PATH $ADDITIONAL_ARGS