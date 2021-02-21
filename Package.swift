// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CGMath",
    platforms: [
        // Relevant platforms.
        .iOS(.v13), .macOS(.v10_15), .tvOS(.v13)
    ],
    products: [
        .library(name: "CGMath", targets: ["CGMath"])
    ],
    dependencies: [
        // It's a good thing to keep things relatively
        // independent, but add any dependencies here.
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
