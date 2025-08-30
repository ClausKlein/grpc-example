find_package(gRPC CONFIG REQUIRED)
find_package(Protobuf REQUIRED)

add_library(proto-object OBJECT)

target_sources(proto-object
  PRIVATE
    helloworld.proto
)
target_include_directories(proto-object
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
)
target_link_libraries(proto-object
  PUBLIC
    protobuf::libprotobuf
    gRPC::grpc++
)

protobuf_generate(
    TARGET proto-object
)

protobuf_generate(
    TARGET proto-object
    LANGUAGE grpc
    GENERATE_EXTENSIONS .grpc.pb.h .grpc.pb.cc
    PLUGIN protoc-gen-grpc=$<TARGET_FILE:gRPC::grpc_cpp_plugin>
)
