// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version: String = "rebranding"
let checksum: String = "9a4441e1193acf8f328b392939d1dcfcc8098f0bb2db7937c6d5946a5b588e22"

let dependencies: [Target.Dependency] = [
    .product(name: "WebRTC", package: "eidwebrtc-spm"),
    .product(name: "Lottie", package: "lottie-spm"),
    .product(name: "OpenSSL", package: "OpenSSL")
]

let package = Package(
    name: "VideoIDSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "VideoIDSDK",
            targets: ["VideoIDSDK", "_VideoIDSDKStub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.4.3"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL.git", from: "3.1.5004"),
        .package(url: "https://github.com/signicat/eidwebrtc-spm", from: "1.1.37")

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

