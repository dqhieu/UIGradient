// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "UIGradient",
    products: [
        .library(name: "UIGradient", targets: ["UIGradient"]),
    ],
    targets: [
         .target(
            name: "UIGradient",
            path: "Sources",
            exclude: [
                "Images",
                "UIGradientExample",
                "UIGradientExample.xcodeproj"
            ]
         )
    ]
)
