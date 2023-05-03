// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let dependencies: [Target.Dependency] = [
    .product(name: "WebRTC", package: "eidwebrtc-spm"),
    .product(name: "Lottie", package: "lottie-spm"),
    .product(name: "OpenSSL", package: "OpenSSL")
]

let package = Package(
    name: "VideoIDSDK",
    products: [
        .library(
            name: "VideoIDSDK",
            targets: ["VideoIDSDK", "_VideoIDSDKStub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.1.3"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMinor(from: "1.1.1700")),
        .package(url: "https://gitlab.electronicid.eu/eid-public/eid-sdk/eidwebrtc-spm", branch: "dev")
    ],
    targets: [
        .binaryTarget(
                    name: "VideoIDSDK",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID-sdk/1.5.0/VideoIDSDK.xcframework.zip",
                    checksum: "f4c1c541705709f262fdf22a8ecf6c0a4b80c97db63f6d2cf7b62d3ffeea88e5"),
        .target(name: "_VideoIDSDKStub",
               dependencies: dependencies)
    ]
)
