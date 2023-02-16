import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let appName: String = "YSTicket"

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleExecutable": "$(EXECUTABLE_NAME)",
    "CFBundleShortVersionString": "1.0",
    "CFBundleVersion": "1",
    "CFBundleIdentifier": "$(PRODUCT_BUNDLE_IDENTIFIER)",
    "CFBundleDisplayName": "YSTicket",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen",
    "UIUserInterfaceStyle": "Light"
]

// MARK: - App
let appTargets: [Target] = AppFactory(
    dependency: AppFactory.Dependency(
        appDependencies: [
            Dep.Project.FoundationKit,
            Dep.Project.DIKit,
            Dep.Project.DataKit,
            Dep.Project.DomainKit,
            Dep.Project.PresentationKit
        ],
        unitTestsDependencies: []
    )
).build(
    payload: AppFactory.Payload(
        bundleID: "kr.byunghak.\(appName)",
        name: appName,
        platform: .iOS,
        infoPlist: infoPlist
    )
)

// MARK: - Project
let project = ProjectFactory(
    dependency: ProjectFactory.Dependency(
        appTargets: appTargets,
        frameworkTargets: []
    )
).build(
    payload: ProjectFactory.Payload(
        name: appName,
        organizationName: "kr.byunghak"
    )
)

