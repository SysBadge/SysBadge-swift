// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SysBadge",
    platforms: [
        .macOS("11.0"),
        .iOS("14.0"),
        .watchOS("7.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SysBadge",
            targets: ["SysBadge"]),
        .library(name: "SysBadge.BLE", targets: ["SysBadge.BLE"])
    ],
    dependencies: [
        .package(url: "https://github.com/manolofdez/AsyncBluetooth", from: .init(stringLiteral: "1.8.1")),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.50.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SysBadge", dependencies: ["AsyncBluetooth"]),
        .target(name: "SysBadge.BLE", dependencies: ["SysBadge", "AsyncBluetooth"]),
        .testTarget(
            name: "SysBadgeTests",
            dependencies: ["SysBadge"]),
    ],
    swiftLanguageVersions: [.v5]
)
