find_package(gRPC CONFIG REQUIRED)
find_package(Protobuf REQUIRED)

add_library(proto-object OBJECT)

target_sources(proto-object
  PRIVATE
    helloworld.proto
  PUBLIC FILE_SET HEADERS
  BASE_DIRS ${CMAKE_CURRENT_BINARY_DIR}
    helloworld.grpc.pb.h helloworld.pb.h
)

# target_include_directories(proto-object
#   PUBLIC
#     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
# )

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

foreach(_target greeter_client greeter_server)
    add_executable(${_target} "${_target}.cc")
    target_link_libraries(${_target}
        proto-object
        absl::check
        absl::flags
        absl::flags_parse
        absl::log
        absl::log_initialize
        gRPC::grpc++_reflection
    )
endforeach()
