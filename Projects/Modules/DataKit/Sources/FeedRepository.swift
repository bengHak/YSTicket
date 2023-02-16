//
//  FeedRepository.swift
//  DataKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation
import RxSwift

import DomainKit

public class FeedRepository: FeedRepositoryProtocol {
    
    private let feedService: FeedServiceProtocol
    
    public init(feedService: FeedServiceProtocol) {
        self.feedService = feedService
    }
    
    public func fetchMainFeed() -> Single<MainFeedDTO> {
        return feedService.fetchFeeds()
    }
}
