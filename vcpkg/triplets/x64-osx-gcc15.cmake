# Usage:
# ~/vcpkg/vcpkg install --triplet x64-osx-gcc15

# Target architecture
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CMAKE_SYSTEM_NAME Darwin)

# vcpkg requires CRT linkage to be set, even though it's irrelevant on macOS
set(VCPKG_CRT_LINKAGE dynamic)

# Use static or dynamic libraries depending on your preference:
#   static  → smaller binaries, fewer runtime dependencies
#   dynamic → smaller vcpkg install size, faster builds
set(VCPKG_LIBRARY_LINKAGE dynamic)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 23)

# Force g++-15 on OSX
# set(CMAKE_C_COMPILER "/usr/local/bin/gcc-15")
# set(CMAKE_CXX_COMPILER "/usr/local/bin/g++-15")

# Ensure we use libstdc++ from GCC instead of Apple's libc++
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++23 -stdlib=libstdc++")
# set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   -stdlib=libstdc++")

# Ensure correct macOS SDK is used (needed when mixing GCC and macOS headers)
if (APPLE)
    execute_process(
        COMMAND xcrun --sdk macosx --show-sdk-path
        OUTPUT_VARIABLE SDK_PATH
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    set(CMAKE_OSX_SYSROOT ${SDK_PATH})
endif()

