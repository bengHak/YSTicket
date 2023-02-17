//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 고병학 on 2023/02/10.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let frameworkName: String = "ThirdPartyManager"

let frameworkTargets: [Target] = FrameworkFactory(
    dependency: .init(
        frameworkDependencies: [
            .SPM.RxSwift,
            .SPM.RxCocoa,
            .SPM.RxDataSources,
            .SPM.Moya,
            .SPM.RxMoya,
            .SPM.Then,
            .SPM.SnapKit,
            .SPM.Kingfisher
        ],
        unitTestsDependencies: []
    )
).build(
    payload: .init(
        name: frameworkName,
        platform: .iOS,
        product: .framework
    )
)

let project = ProjectFactory(
    dependency: .init(
        appTargets: [],
        frameworkTargets: frameworkTargets
    )
).build(
    payload: .init(
        name: frameworkName,
        organizationName: "kr.byunghak"
    )
)
