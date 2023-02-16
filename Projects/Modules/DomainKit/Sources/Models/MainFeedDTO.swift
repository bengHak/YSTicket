//
//  MainFeedDTO.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct MainFeedDTO: Codable {
    public var ysTvList: [YSTv]?
    public var recommendedEventList: [YSEvent]?
    public var newEventList: [YSEvent]?
    
    public init(ysTvList: [YSTv]? = nil, recommendedEventList: [YSEvent]? = nil, newEventList: [YSEvent]? = nil) {
        self.ysTvList = ysTvList
        self.recommendedEventList = recommendedEventList
        self.newEventList = newEventList
    }
}
