// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "S3PublishDeploy",
    platforms: [.macOS(.v12)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "S3PublishDeploy",
            targets: ["S3PublishDeploy"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.5.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "S3PublishDeploy",
            dependencies: [
          .product(name: "Publish", package: "Publish")
        ]),
        .testTarget(
            name: "S3PublishDeployTests",
            dependencies: ["S3PublishDeploy"]),
    ]
)
