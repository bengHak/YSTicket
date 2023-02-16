//
//  DisplayTagList.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct DisplayTagList: Codable {
    public var tagName: String?
    public var tagLink: String?
    public var tagRank, createAdminID, updateAdminID: Int?
    public var createAt, updatedAt: String?
    public var id: Int?
    public var tagID: String?

    enum CodingKeys: String, CodingKey {
        case tagName, tagLink, tagRank
        case createAdminID = "createAdminId"
        case updateAdminID = "updateAdminId"
        case createAt, updatedAt, id
        case tagID = "tagId"
    }

    public init(tagName: String?, tagLink: String?, tagRank: Int?, createAdminID: Int?, updateAdminID: Int?, createAt: String?, updatedAt: String?, id: Int?, tagID: String?) {
        self.tagName = tagName
        self.tagLink = tagLink
        self.tagRank = tagRank
        self.createAdminID = createAdminID
        self.updateAdminID = updateAdminID
        self.createAt = createAt
        self.updatedAt = updatedAt
        self.id = id
        self.tagID = tagID
    }
}
