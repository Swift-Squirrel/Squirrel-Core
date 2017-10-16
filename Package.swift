// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SquirrelCore",
    products: [
        .library(
            name: "SquirrelCore",
            targets: ["SquirrelCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sharplet/Regex.git",  from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "SquirrelCore",
            dependencies: ["Regex"]),
        .testTarget(
            name: "SquirrelCoreTests",
            dependencies: ["SquirrelCore"]),
    ]
)
