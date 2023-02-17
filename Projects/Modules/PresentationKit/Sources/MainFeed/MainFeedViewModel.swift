//
//  MainFeedViewModel.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

import DomainKit

public protocol MainFeedViewModelProtocol {
    var isLoading: BehaviorRelay<Bool> { get }
    var isError: BehaviorRelay<Bool> { get }
    var youtubeData: BehaviorRelay<[YSTv]> { get }
    var recommendedEvent: BehaviorRelay<[YSEvent]> { get }
    var newEvent: BehaviorRelay<[YSEvent]> { get }
    
    func fetchMainFeeds()
}

public final class MainFeedViewModel: MainFeedViewModelProtocol {
    
    private let fetchFeedUseCase: FetchFeedUseCaseProtocol
    private let disposeBag: DisposeBag = .init()

    public let isError: BehaviorRelay<Bool>               = .init(value: false)
    public let isLoading: BehaviorRelay<Bool>             = .init(value: false)

    public let youtubeData: BehaviorRelay<[YSTv]>         = .init(value: [])
    public let newEvent: BehaviorRelay<[YSEvent]>         = .init(value: [])
    public let recommendedEvent: BehaviorRelay<[YSEvent]> = .init(value: [])
    
    public init(fetchFeedUseCase: FetchFeedUseCaseProtocol) {
        self.fetchFeedUseCase = fetchFeedUseCase
    }
    
    public func fetchMainFeeds() {
        guard !isLoading.value else { return }
        isLoading.accept(true)
        fetchFeedUseCase.fetchFeeds()
            .subscribe { [weak self] (mainFeedDTO: MainFeedDTO) in
                guard let youtubeData = mainFeedDTO.ysTvList,
                      let recommendedData = mainFeedDTO.recommendedEventList,
                      let newData = mainFeedDTO.newEventList else {
                    self?.isError.accept(true)
                    self?.isLoading.accept(false)
                    return
                }
                self?.youtubeData.accept(youtubeData)
                self?.recommendedEvent.accept(recommendedData)
                self?.newEvent.accept(newData)
                self?.isLoading.accept(false)
            } onFailure: {[weak self] error in
                print(error)
                self?.isError.accept(true)
                self?.isLoading.accept(false)
            }.disposed(by: disposeBag)
    }
}
