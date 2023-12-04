// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ENMobileUtils",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ENMobileUtilsDependenciesWrapper",
            type: .dynamic
            targets: ["ENMobileUtilsDependenciesWrapper"]
        ),
        .library(
            name: "ENMobileUtils",
            targets: ["ENMobileUtils"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.0"),
        .package(url: "https://github.com/hmlongco/Factory", from: "2.2.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT", from: "3.6.200"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.17")
    ],
    targets: [
    //    .target(
    //        name: "ENMobileUtils",
    //        dependencies: ["Alamofire", "Factory", .product(name: "SwiftJWT", package: "Swift-JWT"), "ZIPFoundation"],
    //        path: "Sources/ENMobileUtils"
    //    ),
    //    .target(
    //      name: "ENMobileUtilsTarget",
    //      dependencies: [.target(name: "ENMobileUtilsWrapper")],
    //      path: "SwiftPM-PlatformExclude/Wrapper"
    //    ),
        .target(
            name: "ENMobileUtilsDependenciesWrapper",
            dependencies: [
                .target(name: "ENMobileUtils"),
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
            checksum: "c913d3c3e82324100a4c4a088d7fa326cf1a9e1628d877c8d093c0ed19c72dbd"
            //checksum: "b3b80618364cce2589fc847462a661cd429bfce5e5588f01e6329be311ab7f0b"
        ),

        
        // .target(
        //   name: "ENMobileUtilsTarget",
        //   dependencies: [.target(name: "ENMobileUtilsWrapper",
        //                          condition: .when(platforms: [.iOS]))],
        //   path: "SwiftPM-PlatformExclude/Wrapper"
        // ),
        // .target(
        //   name: "ENMobileUtilsWrapper",
        //   dependencies: [
        //     // .target(
        //     //   name: "ENMobileUtils",
        //     //   condition: .when(platforms: [.iOS])
        //     // ),
        //     .product(name: "Alamofire", package: "Alamofire"),      
        //     .product(name: "SwiftJWT", package: "Swift-JWT"),
        //     .product(name: "Factory", package: "Factory"),
        //     .product(name: "ZIPFoundation", package: "ZIPFoundation")
        //   ],
        //   path: "Wrapper"
        // ),
        // .binaryTarget(
        //     name: "ENMobileUtils",    
        //     url: "https://xcframeworks.s3.eu-south-1.amazonaws.com/ENMobileUtils/1.0.3/ENMobileUtils.zip",    
        //     checksum: "c913d3c3e82324100a4c4a088d7fa326cf1a9e1628d877c8d093c0ed19c72dbd"
        //     //checksum: "b3b80618364cce2589fc847462a661cd429bfce5e5588f01e6329be311ab7f0b"    
        // )
    ]
)
