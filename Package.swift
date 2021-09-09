// swift-tools-version:5.3

import PackageDescription
let package = Package(
    name: "shared-graphics-buffer",
    platforms: [
        .iOS(.v12),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "SharedGraphicsBuffer",
            targets: ["SharedGraphicsBuffer"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/eugenebokhan/metal-tools.git",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "SharedGraphicsBuffer",
            dependencies: [
                .product(
                    name: "MetalTools",
                    package: "metal-tools"
                )
            ]
        )
    ]
)
