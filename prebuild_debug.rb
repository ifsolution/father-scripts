def prebuild_debug!
  plugin "cocoapods-binary-cache"

  config_cocoapods_binary_cache(
    cache_repo: {
      "default" => {
        "local" => ".binary-pods/debug",
      },
    },
    prebuild_config: "Debug",
    device_build_enabled: true,
    xcframework: true,
    disable_dsym: true,
    save_cache_validation_to: ".binary-pods/debug-validation",
    excluded_pods: [
      "Boardy", "CoreRemoteSettings", "FirebaseABTesting", "FirebaseCore", 
      "FirebaseCoreDiagnostics", "FirebaseInstallations", "FirebaseMessaging", 
      "FirebaseRemoteConfig", "FirebaseRemoteSettings", "GoogleDataTransport", 
      "GoogleUtilities", "Localize-Swift", "PromisesObjC", "SiFUtilities", 
      "SwiftMessages", "SwiftyStoreKit", "ViewStateCore", "nanopb"
    ],
  )
end
