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
            .catch { [weak self] error in
                guard let self else {
                    return .error(FeedServiceError.failedToFetchFeed)
                }
                return self.getLocalJsonFile()
            }
    }
    
    /*
     API 사용량 초과 에러 대응용 로컬파일 불러오는 함수
     {
         "error": {
             "name": "usageLimitError",
             "header": "Usage limit reached",
             "message": "Your team plan allows 1000 mock server calls per month. Contact your team Admin to up your limit."
         }
     }
     */
    private func getLocalJsonFile() -> Single<MainFeedDTO> {
        if let path = Bundle.main.path(forResource: "response", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let response = try decoder.decode(MainFeedResponse.self, from: data)
                return .just(
                    .init(
                        ysTvList: response.results?.ysTvList,
                        recommendedEventList: response.results?.recommendEventList,
                        newEventList: response.results?.newEventList
                    )
                )
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return .error(FeedServiceError.failedToFetchFeed)
    }
}

public enum FeedServiceError: Error {
    case failedToFetchFeed
}
