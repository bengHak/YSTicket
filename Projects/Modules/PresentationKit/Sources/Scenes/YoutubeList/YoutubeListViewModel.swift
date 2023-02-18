//
//  YoutubeListViewModel.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/17.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

import DomainKit

public protocol YoutubeListViewModelProtocol {
    var youtubeData: BehaviorRelay<[YSTv]> { get }
}

public final class YoutubeListViewModel: YoutubeListViewModelProtocol {
    public let youtubeData: BehaviorRelay<[YSTv]>
    
    public init(youtubeData: BehaviorRelay<[YSTv]>) {
        self.youtubeData = youtubeData
    }
}
