// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkVersion: String = "1.45.0"
let checksum: String = "2e566a861bbf6c5a288c66d951118e69a1149e49dd911ae2cb9cf0b6db6bce04"

let dependencies: [Target.Dependency] = [
    .product(name: "WebRTC", package: "WebRTC"),
    .product(name: "Lottie", package: "lottie-spm")]

let package = Package(
    name: "VideoIDSDK",
    platforms: [.iOS("15.1"),
                .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "VideoIDSDK",
            targets: ["VideoIDSDK", "_VideoIDSDKStub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.4.3"),
        .package(url: "https://github.com/stasel/WebRTC.git", exact: "134.0.0")
    ],
    targets: [
        .binaryTarget(
                    name: "VideoIDSDK",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID-sdk/\(sdkVersion)/VideoIDSDK.xcframework.zip",
                    checksum: checksum),
        .target(
            name: "_VideoIDSDKStub",
            dependencies: dependencies,
            swiftSettings: [
                .define("PLATFORM_IOS_ONLY", .when(platforms: [.iOS]))
            ]
        )
    ]
)

