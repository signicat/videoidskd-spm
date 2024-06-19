// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version: String = "1.21.0"
let checksum: String = "c92ca9c9c28992e24c3b441bdd5b913fb69e8d7eeb27a309c722325eb89437c4"

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
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.1.3"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", from: "1.1.2000"),
        .package(url: "https://github.com/signicat/eidwebrtc-spm", branch: "feature/VID-7398-change-gihub-repository")
    ],
    targets: [
        .binaryTarget(
                    name: "VideoIDSDK",
                    url:"https://eid-librerias-ios.s3.eu-west-1.amazonaws.com/VideoID-sdk/\(version)/VideoIDSDK.xcframework.zip",
                    checksum: checksum),
        .target(name: "_VideoIDSDKStub",
                dependencies: dependencies)
    ]
)

