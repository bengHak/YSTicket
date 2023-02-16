import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "YSTicket",
    projects: [
        "Projects/YSTicket",
        "Projects/Modules/DataKit",
        "Projects/Modules/DomainKit",
        "Projects/Modules/FoundationKit",
        "Projects/Modules/PresentationKit",
        "Projects/Modules/ThirdPartyManager"
    ],
    schemes: [
        Scheme(
            name: "YSTicketApp",
            buildAction: .buildAction(targets: [
                .project(path: "Projects/YSTicket", target: "YSTicket"),
                .project(path: "Projects/Modules/DataKit", target: "DataKit"),
                .project(path: "Projects/Modules/DomainKit", target: "DomainKit"),
                .project(path: "Projects/Modules/FoundationKit", target: "FoundationKit"),
                .project(path: "Projects/Modules/PresentationKit", target: "PresentationKit"),
                .project(path: "Projects/Modules/ThirdPartyManager", target: "ThirdPartyManager")
            ])
        )
    ],
    generationOptions: .options(
        autogeneratedWorkspaceSchemes: .disabled
    )
)