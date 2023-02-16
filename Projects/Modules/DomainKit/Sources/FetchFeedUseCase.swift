//
//  FetchFeedUseCase.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation
import RxSwift

public protocol FetchFeedUseCaseProtocol {
    func fetchFeeds() -> Single<MainFeedDTO>
}

public class FetchFeedUseCase: FetchFeedUseCaseProtocol {
    
    private let feedRepository: FeedRepositoryProtocol
    
    public init(feedRepository: FeedRepositoryProtocol) {
        self.feedRepository = feedRepository
    }
    
    public func fetchFeeds() -> Single<MainFeedDTO> {
        return feedRepository.fetchMainFeed()
    }
}
