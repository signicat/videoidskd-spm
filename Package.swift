// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VideoIDSDK",
    products: [
        .library(
            name: "VideoIDSDK",
            targets: ["VideoIDSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.1.3"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMinor(from: "1.1.1700")),
        .package(url: "https://gitlab.electronicid.eu/eid-public/eid-sdk/eidwebrtc-spm", branch: "dev")
    ],
    targets: [
        .binaryTarget(
            name: "VideoIDSDK",
            path: "VideoIDSDK.xcframework"
        ),
    ]
)
