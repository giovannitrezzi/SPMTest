// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ENMobileUtils",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ENMobileUtils",
            type: .dynamic,
            targets: ["ENMobileUtils"]
        ),
        .library(
            name: "ENMobileUtilsDependencies",
            type: .dynamic,
            targets: ["ENMobileUtilsDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
        .package(url: "https://github.com/hmlongco/Factory", from: "2.2.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT", from: "3.6.200"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.17")
    ],
    targets: [
//        .target(
//            name: "ENMobileUtils",
//            dependencies: ["Alamofire", "Factory", .product(name: "SwiftJWT", package: "Swift-JWT"), "ZIPFoundation"],
//            path: "Sources/ENMobileUtils"
//        ),
        .target(
            name: "ENMobileUtilsDependencies",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftJWT", package: "Swift-JWT"),
                .product(name: "Factory", package: "Factory"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: "Wrapper"
        ),
        .binaryTarget(
            name: "ENMobileUtils",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileUtils/1.0.3/ENMobileUtils.zip",
            checksum: "e450e0daa4d37cac24fbc18881334a2b6f506217f8cd867fc8b2a7c113649fdf"
            //checksum: "b3b80618364cce2589fc847462a661cd429bfce5e5588f01e6329be311ab7f0b"
        )
    ]
)
