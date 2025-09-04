cmake_minimum_required(VERSION 3.27...4.1)

include(vcpkg/BootstrapVcpkg.cmake)

project(grpc-example LANGUAGES CXX)

add_executable(app)
target_compile_features(app
  PRIVATE
    cxx_std_23
)

add_subdirectory(src)
