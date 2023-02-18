//
//  YoutubeHeader.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/17.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import RxSwift
import SnapKit
import Then
import UIKit

final class YoutubeHeader: UICollectionReusableView {
    // MARK: - UI properties
    private let sectionTitleLabel: UILabel = .init().then {
        $0.text = "여신TV 인기영상"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .gray01
    }
    
    private let moreButton: UIButton = .init().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.gray03, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    // MARK: - Properties
    static let identifier: String = "YoutubeHeader"
    private var disposeBag: DisposeBag = .init()
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Helpers
    private func configureView() {
        addSubview(sectionTitleLabel)
        sectionTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func bind(_ didTapMoreButton: @escaping () -> Void) {
        let bag: DisposeBag = .init()
        moreButton.rx.tap
            .bind { didTapMoreButton() }
            .disposed(by: bag)
        disposeBag = bag
    }
}
