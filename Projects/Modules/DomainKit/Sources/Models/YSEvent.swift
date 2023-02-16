//
//  EventList.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation

public struct YSEvent: Codable {
    public var name, comment, customerName, displayName: String?
    public var price: Int?
    public var currencyName: CurrencyName?
    public var customerCode: String?
    public var score: Int?
    public var cpmBudgetScore: Double?
    public var locationName, productCode: String?
    public var wishCount, reviewCount, rateScore, distance: Int?
    public var wishIcon: WishIcon?
    public var thumbnailImageURL: String?
    public var detailLinkURL: String?
    public var reservationYn: ReservationYn?

    enum CodingKeys: String, CodingKey {
        case name, comment, customerName, displayName, price, currencyName, customerCode, score, cpmBudgetScore, locationName, productCode, wishCount, reviewCount, rateScore, distance, wishIcon
        case thumbnailImageURL = "thumbnailImageUrl"
        case detailLinkURL = "detailLinkUrl"
        case reservationYn
    }

    public init(name: String?, comment: String?, customerName: String?, displayName: String?, price: Int?, currencyName: CurrencyName?, customerCode: String?, score: Int?, cpmBudgetScore: Double?, locationName: String?, productCode: String?, wishCount: Int?, reviewCount: Int?, rateScore: Int?, distance: Int?, wishIcon: WishIcon?, thumbnailImageURL: String?, detailLinkURL: String?, reservationYn: ReservationYn?) {
        self.name = name
        self.comment = comment
        self.customerName = customerName
        self.displayName = displayName
        self.price = price
        self.currencyName = currencyName
        self.customerCode = customerCode
        self.score = score
        self.cpmBudgetScore = cpmBudgetScore
        self.locationName = locationName
        self.productCode = productCode
        self.wishCount = wishCount
        self.reviewCount = reviewCount
        self.rateScore = rateScore
        self.distance = distance
        self.wishIcon = wishIcon
        self.thumbnailImageURL = thumbnailImageURL
        self.detailLinkURL = detailLinkURL
        self.reservationYn = reservationYn
    }
}

public enum CurrencyName: String, Codable {
    case 원
}

public enum ReservationYn: String, Codable {
    case n = "N"
    case y = "Y"
}

public enum WishIcon: String, Codable {
    case off
}
