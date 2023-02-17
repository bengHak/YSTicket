//
//  RecommendHeader.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/17.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import SnapKit
import Then
import UIKit

final class RecommendHeader: UICollectionReusableView {
    // MARK: - UI properties
    private let sectionLabel: UILabel = .init().then {
        let attributedString = NSMutableAttributedString(string: "추천이벤트")
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            .foregroundColor: UIColor.gray01
        ]
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: attributedString.length))
        let pinkAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.pink01
        ]
        attributedString.addAttributes(pinkAttributes, range: NSRange(location: 2, length: 3))
        $0.attributedText = attributedString
    }
    
    private let bottomBorder: UIView = .init().then {
        $0.backgroundColor = .black
    }
    
    // MARK: - Properties
    static let identifier: String = "RecommendHeader"
    
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
        addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        addSubview(bottomBorder)
        bottomBorder.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1.5)
        }
    }
}
