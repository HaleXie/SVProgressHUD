// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SVProgressHUD",
    platforms: [
        .iOS(.v16),
        .visionOS(.v2)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SVProgressHUD",
            targets: ["SVProgressHUD"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        .target(
            name: "SVProgressHUD",
            dependencies: [],
            path: "SVProgressHUD",
            sources: [
                "SVProgressHUD.m",
                "SVIndefiniteAnimatedView.m",
                "SVProgressAnimatedView.m",
                "SVRadialGradientLayer.m"
            ],
            resources: [
                .process("SVProgressHUD.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .define("SVProgressHUD_SPM", to: "1"),
                .define("SV_APP_EXTENSIONS", .when(platforms: [.iOS, .visionOS])),
                .unsafeFlags(["-fmodules"], .when(platforms: [.iOS, .visionOS]))
            ],
            linkerSettings: [
                .linkedFramework("QuartzCore"),
                .linkedFramework("UIKit")
            ]
        ),
    ]
)
