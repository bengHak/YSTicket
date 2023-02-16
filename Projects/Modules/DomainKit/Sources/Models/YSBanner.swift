//
//  BannerList.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct YSBanner: Codable {
    public var bannerID, bannerType: String?
    public var bannerImg: String?
    public var bannerLink: String?
    public var bannerTitle, bannerListRank, bannerStartDate, bannerEndDate: String?

    enum CodingKeys: String, CodingKey {
        case bannerID = "bannerId"
        case bannerType, bannerImg, bannerLink, bannerTitle, bannerListRank, bannerStartDate, bannerEndDate
    }

    public init(bannerID: String?, bannerType: String?, bannerImg: String?, bannerLink: String?, bannerTitle: String?, bannerListRank: String?, bannerStartDate: String?, bannerEndDate: String?) {
        self.bannerID = bannerID
        self.bannerType = bannerType
        self.bannerImg = bannerImg
        self.bannerLink = bannerLink
        self.bannerTitle = bannerTitle
        self.bannerListRank = bannerListRank
        self.bannerStartDate = bannerStartDate
        self.bannerEndDate = bannerEndDate
    }
}
