// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SquirrelCore",
    products: [
        .library(
            name: "SquirrelCore",
            targets: ["SquirrelCore"]),
    ],
    targets: [
        .target(
            name: "SquirrelCore"),
        .testTarget(
            name: "SquirrelCoreTests",
            dependencies: ["SquirrelCore"]),
    ]
)
