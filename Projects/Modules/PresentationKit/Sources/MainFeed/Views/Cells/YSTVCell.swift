//
//  YSTVCell.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/16.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Kingfisher
import SnapKit
import Then
import UIKit

import DomainKit

final class YSTVCell: UICollectionViewCell {
    // MARK: - UI properties
    private let thumbnailImageView: UIImageView = .init().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 14
        $0.clipsToBounds = true
    }
    
    private let titleLabel: UILabel = .init().then {
        $0.textColor = .init(red: 109/255, green: 109/255, blue: 109/255, alpha: 1.0)
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    // MARK: - Properties
    static let identifier: String = "YSTVCell"
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        titleLabel.text = nil
    }
    
    // MARK: - Helpers
    private func configureView() {
        addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(110)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
    }
    
    func bind(_ data: YSTv) {
        titleLabel.text = data.tvNameMain
        guard let urlString = data.tvFullImgURL,
              let url = URL(string: urlString) else {
            return
        }
        thumbnailImageView.kf.setImage(with: url)
    }
}
