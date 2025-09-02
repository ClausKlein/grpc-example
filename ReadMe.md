[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/nickelpro/grpc-example/main.yaml?style=for-the-badge)](https://github.com/nickelpro/grpc-example/actions/workflows/main.yaml)

# grpc-example

This is an example of how to use gRPC with CMake.

The principal usage is in src/proto/CMakeList.txt.

This repo bootstraps vcpkg to provide gRPC if the option `-DBOOTSTRAP_VCPKG=ON`
is passed to CMake during configuration. A local installation could be used via
its associated toolchain file, or gRPC/protobuf could be provided via any other
toolchain or `find_package()` discovery mechanism.

see too https://grpc.io/docs/what-is-grpc/introduction/
    and https://grpc.io/docs/languages/cpp/quickstart/
