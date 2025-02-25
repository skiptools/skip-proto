// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "skip-proto",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipProto", targets: ["SkipProto"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.25.1"),
    ],
    targets: [
    .target(name: "SkipProto", dependencies: [.product(name: "SkipFoundation", package: "skip-foundation"), .product(name: "SwiftProtobuf", package: "swift-protobuf")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    .testTarget(name: "SkipProtoTests", dependencies: [
        "SkipProto",
        .product(name: "SkipTest", package: "skip")
    ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
