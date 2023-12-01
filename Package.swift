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
            targets: ["ENMobileUtils"]
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
            name: "ENMobileUtils",
            dependencies: [
                .target(name: "ENMobileUtilsFramework"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftJWT", package: "Swift-JWT"),
                .product(name: "Factory", package: "Factory"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: "Wrapper"
        ),
        .binaryTarget(
            name: "ENMobileUtilsFramework",
            url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileUtils/1.0.3/ENMobileUtils.zip",
            checksum: "5a8b9581f346b73714f05a4bbe950276202d80429186f2fa24bb76976736af79"
            //checksum: "b3b80618364cce2589fc847462a661cd429bfce5e5588f01e6329be311ab7f0b"
        )
    ]
)
