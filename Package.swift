// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskMessagingAPISDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskMessagingAPISDK",
            targets: [
              "ZendeskMessagingAPISDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskSDKConfigurationsSDK",
                 url: "https://github.com/JZDesign/sdkconfigurations_sdk_ios",
                 .branch("xcode.13.spm.for.5.5.0"))
    ],
    targets: [
        .binaryTarget(
            name: "MessagingAPI",
            path: "MessagingAPI.xcframework"
        ),
        .target(name: "ZendeskMessagingAPISDKTargets",
                dependencies: [
                    .target(name: "MessagingAPI"),
                    .product(name: "ZendeskSDKConfigurationsSDK", package: "ZendeskSDKConfigurationsSDK")
                ],
                path: "Sources"
        )
    ]
)
