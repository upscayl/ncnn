#!/bin/bash

# Get argument for platform
PLATFORM=$1

cd build-$PLATFORM

# IF arm64
if [ $PLATFORM == "arm64" ]; then
		# Run upscayl-bin
		cmake -D USE_STATIC_MOLTENVK=ON \
		-D CMAKE_OSX_ARCHITECTURES="arm64"\
		 -D CMAKE_CROSSCOMPILING=ON \
		 -D CMAKE_SYSTEM_PROCESSOR=arm64 \
		 -D OpenMP_C_FLAGS="-Xclang -fopenmp" \
		 -D OpenMP_CXX_FLAGS="-Xclang -fopenmp -I/opt/homebrew/opt/libomp/include" \
		 -D OpenMP_C_LIB_NAMES="libomp" \
		 -D OpenMP_CXX_LIB_NAMES="libomp" \
		 -D OpenMP_libomp_LIBRARY="/opt/homebrew/opt/libomp/lib/libomp.a" \
		 -D Vulkan_INCLUDE_DIR="../vulkan-sdk/macOS/include" \
		 -D Vulkan_LIBRARY=../vulkan-sdk/macOS/lib/MoltenVK.xcframework/macos-arm64_x86_64/libMoltenVK.a \
		../src ;
		cmake --build .;
else
		# Run upscayl-bin
		echo "Building for other platforms needs to be added to build.sh"
fi