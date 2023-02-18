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
    
    private let placeName: UILabel = .init().then {
        $0.textColor = .gray02
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    private let titleLabel: UILabel = .init().then {
        $0.textColor = .gray01
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private let descLabel: UILabel = .init().then {
        $0.textColor = .gray02
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.numberOfLines = 0
    }
    
    private let priceLabel: UILabel = .init().then {
        $0.textColor = .gray01
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
    }
    
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
        setData()
    }
    
    // MARK: - Helpers
    private func configureView() {
        view.backgroundColor = .white
        title = ysEvent.name
        [imageView,
         placeName,
         titleLabel,
         descLabel,
         priceLabel
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureSubViews() {
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(UIScreen.main.bounds.width-40)
        }
        
        placeName.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(placeName.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(26)
        }
        
        descLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.greaterThanOrEqualTo(20)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(32)
        }
    }
    
    private func setData() {
        if let urlString = ysEvent.thumbnailImageURL,
           let url = URL(string: urlString) {
            imageView.kf.setImage(with: url, placeholder: UIImage(named: "PlaceholderImage"))
        }
        placeName.text = ysEvent.displayName
        titleLabel.text = ysEvent.name
        descLabel.text = ysEvent.comment
        priceLabel.text = "\(ysEvent.price ?? 0)\(ysEvent.currencyName ?? .원)"
    }
}
