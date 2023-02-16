//
//  FeedAPI.swift
//  DataKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Foundation
import Moya

enum FeedAPI {
    case fetchMainFeed
}

extension FeedAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://b1804a28-20f2-4c1d-b643-a8456583a821.mock.pstmn.io/latest/ios/products")!
    }
    
    var path: String {
        switch self {
        case .fetchMainFeed:
            return "/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchMainFeed:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchMainFeed:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
