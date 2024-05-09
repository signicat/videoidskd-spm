// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version: String = "1.19.0"
let checksum: String = "f25fe92c3f80e054d274f1fe6b36addd1c6a41b3bc6706ce3e647a66e9ee49ff"

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
        .package(url: "https://gitlab.electronicid.eu/eid-public/eid-sdk/eidwebrtc-spm", from: "1.1.35")
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

