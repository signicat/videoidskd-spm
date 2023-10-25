// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let dependencies: [Target.Dependency] = [
    .product(name: "WebRTC", package: "eidwebrtc-spm"),
    .product(name: "Lottie", package: "lottie-ios"),
    .product(name: "OpenSSL", package: "OpenSSL")
]

let package = Package(
    name: "VideoIDSDK",
    products: [
        .library(
            name: "VideoIDSDK",
            type: .dynamic,
            targets: ["VideoIDSDK", "_VideoIDSDKStub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.0.1"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", from: "1.1.2000"),
        .package(url: "https://gitlab.electronicid.eu/eid-public/eid-sdk/eidwebrtc-spm", from: "1.1.35")
    ],
    targets: [
        .binaryTarget(
                    name: "VideoIDSDK",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID-sdk/1.8.0/VideoIDSDK.xcframework.zip",
                    checksum: "d8ef54e5bd8a1b14113f01fc7c86bf20f2846a64c6b678afa2fe1a6adcd62a1f"),
        .target(name: "_VideoIDSDKStub",
                dependencies: dependencies)
    ]
)
