# Steps:

1. Clone the main repository:

   `git clone https://github.com/upscayl/upscayl-ncnn.git`

   `cd upscayl-ncnn`

2. Pull all the submodules (this step requires an SSH key be added to your account):
   `git submodule update --init --recursive`
3. Download a Vulkan SDK tarball from [https://vulkan.lunarg.com/sdk/home](https://vulkan.lunarg.com/sdk/home) and extract it using:\

   `tar -xf vulkansdk-linux-x86_64-1.3.261.0.tar.xz`

4. Install cmake, and gcc-9 and g++-9 from distro package manager
5. Set up environment variables:`export CXX="g++-9" CC="gcc-9"`
6. `export VULKAN_SDK=/path` where you extracted your vulkan SDK/1.3.261.0/x86_64
7. Make a new build directory and cd into it. Follow the next steps: `mkdir build && cd build`
8. Now, build: `cmake ../src`
9. `cmake --build . -j 2` Replace the `-j 2` with the number of cores you wanna use to compile

## MacOS

### Prerequisites:

- openmp installed, install with `brew install libomp`
- cmake installed, install with `brew install cmake`
- Install vulkansdk from the website and it should be in /Users/youruser/VulkanSDK/`<version>` normally if you did not change anything

### Steps:

After making the build directory, open it and use the following cmake command (replace the paths from your system)

```bash
mkdir build-x86_64 && cd build-x86_64
cmake -D USE_STATIC_MOLTENVK=ON -D CMAKE_OSX_ARCHITECTURES="x86_64" -D OpenMP_C_FLAGS="-Xclang -fopenmp" -D OpenMP_CXX_FLAGS="-Xclang -fopenmp" -D OpenMP_C_LIB_NAMES="libomp" -D OpenMP_CXX_LIB_NAMES="libomp" -D OpenMP_libomp_LIBRARY="/opt/homebrew/opt/libomp/lib/libomp.a" -D Vulkan_INCLUDE_DIR="./VulkanSDK/*/MoltenVK/include" -D Vulkan_LIBRARY=./VulkanSDK/*/MoltenVK/MoltenVK.xcframework/macos-arm64_x86_64/libMoltenVK.a ../src
cmake --build . -j 8
```

For arm processors, the build command will only change to

```bash
mkdir build-arm64 && cd build-arm64
cmake -D USE_STATIC_MOLTENVK=ON -D CMAKE_OSX_ARCHITECTURES="arm64" -D CMAKE_CROSSCOMPILING=ON -D CMAKE_SYSTEM_PROCESSOR=arm64 -D OpenMP_C_FLAGS="-Xclang -fopenmp" -D OpenMP_CXX_FLAGS="-Xclang -fopenmp -I/opt/homebrew/opt/libomp/include" -D OpenMP_C_LIB_NAMES="libomp" -D OpenMP_CXX_LIB_NAMES="libomp" -D OpenMP_libomp_LIBRARY="/opt/homebrew/opt/libomp/lib/libomp.a" -D Vulkan_INCLUDE_DIR="../VulkanSDK/1.3.261.1/MoltenVK/include" -D Vulkan_LIBRARY="../VulkanSDK/1.3.261.1/MoltenVK/MoltenVK.xcframework/macos-arm64_x86_64/libMoltenVK.a" ../src
cmake --build . -j 8
```
