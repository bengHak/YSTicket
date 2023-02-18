//
//  FeedDetailViewController.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import SnapKit
import Then
import UIKit

import DomainKit

final class FeedDetailViewController: UIViewController {
    // MARK: - UI properties
    private let imageView: UIImageView = .init().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 14
        $0.clipsToBounds = true
    }
    
    private let placeName: UILabel = .init()
    
    private let titleLabel: UILabel = .init()
    
    private let price: UILabel = .init()
    
    // MARK: - Properties
    private let ysEvent: YSEvent
    
    // MARK: - Lifecycles
    init(ysEvent: YSEvent) {
        self.ysEvent = ysEvent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureSubViews()
    }
    
    // MARK: - Helpers
    private func configureView() {
        view.backgroundColor = .white
    }
    
    private func configureSubViews() {
        
    }
}

