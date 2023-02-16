//
//  YsTvList.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct YSTv: Codable {
    public var tvID, tvCode, tvNameMain, tvInputDate: String?
    public var tvViewCount, tvMetatagTitle: String?
    public var tvVideoURL: String?
    public var tvVideoID: String?
    public var tvImgType: TvImgType?
    public var tvVideoThumb: String?
    public var tvFullImgURL: String?

    enum CodingKeys: String, CodingKey {
        case tvID = "tvId"
        case tvCode, tvNameMain, tvInputDate, tvViewCount, tvMetatagTitle
        case tvVideoURL = "tvVideoUrl"
        case tvVideoID = "tvVideoId"
        case tvImgType, tvVideoThumb
        case tvFullImgURL = "tvFullImgUrl"
    }

    public init(tvID: String?, tvCode: String?, tvNameMain: String?, tvInputDate: String?, tvViewCount: String?, tvMetatagTitle: String?, tvVideoURL: String?, tvVideoID: String?, tvImgType: TvImgType?, tvVideoThumb: String?, tvFullImgURL: String?) {
        self.tvID = tvID
        self.tvCode = tvCode
        self.tvNameMain = tvNameMain
        self.tvInputDate = tvInputDate
        self.tvViewCount = tvViewCount
        self.tvMetatagTitle = tvMetatagTitle
        self.tvVideoURL = tvVideoURL
        self.tvVideoID = tvVideoID
        self.tvImgType = tvImgType
        self.tvVideoThumb = tvVideoThumb
        self.tvFullImgURL = tvFullImgURL
    }
}

public enum TvImgType: String, Codable {
    case auto
    case direct
}
