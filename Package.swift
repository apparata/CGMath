// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "CGMath",
    platforms: [
        .iOS(.v16), .macOS(.v12), .tvOS(.v16), .visionOS(.v1)
    ],
    products: [
        .library(name: "CGMath", targets: ["CGMath"])
    ],
    targets: [
        .target(
            name: "CGMath",
            dependencies: [],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
        .testTarget(name: "CGMathTests", dependencies: ["CGMath"]),
    ]
)
