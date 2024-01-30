#!/bin/bash

# Get argument for platform
PLATFORM=$1

BIN_PATH="build-$PLATFORM/upscayl-bin"
ADDITIONAL_ARGS="-i images/input2.jpg -o test.jpg -s 4 -m models/ -n realesrgan-x4plus -c"
# Run upscayl-bin
$BIN_PATH $ADDITIONAL_ARGS