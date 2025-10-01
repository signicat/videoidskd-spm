// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkVersion: String = "1.41.0"
let checksum: String = "287c0f9e75845d84876557dde4a025f658aca3bb74e66288749efddc3e1ddb01"

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

