//
//  FeedRepository.swift
//  DomainKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation
import RxSwift

public protocol FeedRepositoryProtocol {
    func fetchMainFeed() -> Single<MainFeedDTO>
}
