import ProjectDescription

// MARK: - Project

let project = Project(
    name: "SpendSense",
    organizationName: "FinnChristoffer",
    options: .options(
        defaultKnownRegions: ["en", "id"],
        developmentRegion: "en"
    ),
    settings: .settings(
        base: [
            "SWIFT_VERSION": "6.0",
            "IPHONEOS_DEPLOYMENT_TARGET": "17.0"
        ],
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        // MARK: - App Target
        .target(
            name: "SpendSense",
            destinations: .iOS,
            product: .app,
            bundleId: "com.finnchristoffer.SpendSense",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": [
                    "UIColorName": "",
                    "UIImageName": ""
                ]
            ]),
            sources: ["SpendSense/Sources/**"],
            resources: ["SpendSense/Resources/**"],
            dependencies: [
                .target(name: "Core"),
                .target(name: "CoreNavigation"),
                .target(name: "CoreNetwork"),
                .target(name: "Common"),
                .external(name: "Factory")
            ],
            settings: .settings(
                base: [
                    "CODE_SIGN_STYLE": "Automatic",
                    "DEVELOPMENT_TEAM": ""
                ]
            ),
            coreDataModels: [
                .coreDataModel("SpendSense/CoreData/SpendSense.xcdatamodeld")
            ]
        ),

        // MARK: - Unit Tests
        .target(
            name: "SpendSenseTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.finnchristoffer.SpendSenseTests",
            deploymentTargets: .iOS("17.0"),
            sources: ["SpendSenseTests/Sources/**"],
            dependencies: [
                .target(name: "SpendSense"),
                .external(name: "SnapshotTesting")
            ]
        ),

        // MARK: - UI Tests
        .target(
            name: "SpendSenseUITests",
            destinations: .iOS,
            product: .uiTests,
            bundleId: "com.finnchristoffer.SpendSenseUITests",
            deploymentTargets: .iOS("17.0"),
            sources: ["SpendSenseUITests/Sources/**"],
            dependencies: [
                .target(name: "SpendSense")
            ]
        ),

        // MARK: - Core Module
        .target(
            name: "Core",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.finnchristoffer.Core",
            deploymentTargets: .iOS("17.0"),
            sources: ["Modules/Core/Sources/**"],
            dependencies: [
                .external(name: "Factory")
            ]
        ),

        // MARK: - CoreNavigation Module
        .target(
            name: "CoreNavigation",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.finnchristoffer.CoreNavigation",
            deploymentTargets: .iOS("17.0"),
            sources: ["Modules/CoreNavigation/Sources/**"],
            dependencies: [
                .target(name: "Core")
            ]
        ),

        // MARK: - CoreNetwork Module
        .target(
            name: "CoreNetwork",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.finnchristoffer.CoreNetwork",
            deploymentTargets: .iOS("17.0"),
            sources: ["Modules/CoreNetwork/Sources/**"],
            dependencies: [
                .target(name: "Core")
            ]
        ),

        // MARK: - Common Module
        .target(
            name: "Common",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.finnchristoffer.Common",
            deploymentTargets: .iOS("17.0"),
            sources: ["Modules/Common/Sources/**"],
            dependencies: []
        )
    ]
)
