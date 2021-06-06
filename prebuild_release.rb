def prebuild_release!
  plugin "cocoapods-binary-cache"

  config_cocoapods_binary_cache(
    cache_repo: {
      "default" => {
        "local" => ".binary-pods/release",
      },
    },
    prebuild_config: "Release",
    device_build_enabled: true,
    xcframework: true,
    disable_dsym: true,
    bitcode_enabled: false,
    excluded_pods: [
    ],
    build_args: {
      :default => [
        "BUILD_LIBRARY_FOR_DISTRIBUTION=YES",
        "SKIP_INSTALL=NO",
      ],
    },
  )
end
