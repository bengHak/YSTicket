//
//  FeedService.swift
//  DataKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

import DomainKit

public protocol FeedServiceProtocol {
    func fetchFeeds() -> Single<MainFeedDTO>
}

public class FeedService: FeedServiceProtocol {
    
    private let provider: MoyaProvider<FeedAPI> = .init()
    
    public init() {}
    
    public func fetchFeeds() -> Single<MainFeedDTO> {
        provider.rx.request(.fetchMainFeed)
            .filterSuccessfulStatusCodes()
            .map { $0.data }
            .map { try JSONDecoder().decode(MainFeedResponse.self, from: $0) }
            .map {
                MainFeedDTO(
                    ysTvList: $0.results?.ysTvList,
                    recommendedEventList: $0.results?.recommendEventList,
                    newEventList: $0.results?.newEventList
                )
            }
            .catch { error in
                return .error(FeedServiceError.failedToFetchFeed)
            }
    }
}

public enum FeedServiceError: Error {
    case failedToFetchFeed
}
