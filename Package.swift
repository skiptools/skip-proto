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
        .package(url: "https://source.skip.tools/skip.git", from: "0.6.39"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.1.9"),
    ],
    targets: [
    .target(name: "SkipProto", dependencies: [.product(name: "SkipFoundation", package: "skip-foundation", condition: .when(platforms: [.macOS]))], plugins: [.plugin(name: "skipstone", package: "skip")]),
    .testTarget(name: "SkipProtoTests", dependencies: [
        "SkipProto"
    ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
