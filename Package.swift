// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "ErrorClient",
  platforms: [
    .macOS(.v12),
    .iOS(.v16),
    .watchOS(.v8),
    .tvOS(.v16),
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "LoggingClient",
      targets: ["LoggingClient"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.3.9"),
    .package(url: "https://github.com/sideeffect-io/AsyncExtensions", from: "0.5.2"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "LoggingClient",
      dependencies: [
        .product(name: "Dependencies", package: "swift-dependencies"),
        .product(name: "DependenciesMacros", package: "swift-dependencies"),
        .product(name: "AsyncExtensions", package: "AsyncExtensions"),
      ]
    ),
    .testTarget(
      name: "LoggingClientTests",
      dependencies: ["LoggingClient"]
    ),
  ],
  swiftLanguageModes: [.v6]
)
