// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "skip-proto",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
    .library(name: "SkipProto", targets: ["SkipProto"]),
    .library(name: "SkipProtoKt", targets: ["SkipProtoKt"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.0.0"),
        .package(url: "https://source.skip.tools/skip-unit.git", from: "0.0.0"),
        .package(url: "https://source.skip.tools/skip-lib.git", from: "0.0.0"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.0.0"),
    ],
    targets: [
    .target(name: "SkipProto", plugins: [.plugin(name: "skippy", package: "skip")]),
    .target(name: "SkipProtoKt", dependencies: [
        "SkipProto",
        .product(name: "SkipUnitKt", package: "skip-unit"),
        .product(name: "SkipLibKt", package: "skip-lib"),
        .product(name: "SkipFoundationKt", package: "skip-foundation"),
    ], resources: [.process("Skip")], plugins: [.plugin(name: "transpile", package: "skip")]),
    .testTarget(name: "SkipProtoTests", dependencies: [
        "SkipProto"
    ], plugins: [.plugin(name: "skippy", package: "skip")]),
    .testTarget(name: "SkipProtoKtTests", dependencies: [
        "SkipProtoKt",
        .product(name: "SkipUnit", package: "skip-unit"),
    ], resources: [.process("Skip")], plugins: [.plugin(name: "transpile", package: "skip")]),
    ]
)
