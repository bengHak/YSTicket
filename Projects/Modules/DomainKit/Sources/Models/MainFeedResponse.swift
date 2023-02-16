//
//  MainFeedResponse.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct MainFeedResponse: Codable {
    public var serverCode, serverMsg: String?
    public var results: Results?

    public init(serverCode: String?, serverMsg: String?, results: Results?) {
        self.serverCode = serverCode
        self.serverMsg = serverMsg
        self.results = results
    }
}
