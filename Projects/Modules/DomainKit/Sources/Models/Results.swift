//
//  Results.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct Results: Codable {
    public var displayTagList: [DisplayTagList]?
    public var bannerList: [YSBanner]?
    public var recommendEventList, newEventList: [YSEvent]?
    public var ysTvList: [YSTv]?

    public init(displayTagList: [DisplayTagList]?, bannerList: [YSBanner]?, recommendEventList: [YSEvent]?, newEventList: [YSEvent]?, ysTvList: [YSTv]?) {
        self.displayTagList = displayTagList
        self.bannerList = bannerList
        self.recommendEventList = recommendEventList
        self.newEventList = newEventList
        self.ysTvList = ysTvList
    }
}
