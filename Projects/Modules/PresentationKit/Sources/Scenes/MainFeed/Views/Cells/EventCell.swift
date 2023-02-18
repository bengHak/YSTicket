//
//  EventCell.swift
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
import FoundationKit

final class EventCell: UICollectionViewCell {
    // MARK: - UI properties
    /// 썸네일 뷰
    private let thumbnailImageView: UIImageView = .init().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 14
        $0.clipsToBounds = true
        $0.image = UIImage(named: "PlaceholderImage")
    }
    
    /// 위치 라벨
    private let placeLabel: UILabel = .init().then {
        $0.textColor = .gray02
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    /// 타이틀 라벨
    private let titleLabel: UILabel = .init().then {
        $0.textColor = .gray01
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    /// 상세 설명 라벨
    private let descLabel: UILabel = .init().then {
        $0.textColor = .gray03
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.numberOfLines = 2
    }
    
    /// 모바일 예약 가능 태그 뷰
    private let reservationButton: UIButton = .init().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.setTitle("모바일예약", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .pink01
    }
    
    /// 하트 버튼
    private let heartButton: UIButton = .init().then {
        $0.setTitle("♡", for: .normal)
        $0.setTitleColor(.pink01, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 22)
        $0.layer.borderColor = UIColor.gray03.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
    }
    
    /// 가격
    private let priceLabel: UILabel = .init().then {
        $0.textColor = .pink01
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    
    private let priceCurrency: UILabel = .init().then {
        $0.textColor = .gray02
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    /// 관심도
    private let interestLabel: UILabel = .init().then {
        $0.text = "관심도"
        $0.textColor = .gray02
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    private let interestCount: UILabel = .init().then {
        $0.textColor = .pink01
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    /// 리뷰
    private let reviewLabel: UILabel = .init().then {
        $0.text = "리뷰"
        $0.textColor = .gray02
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    private let reviewCount: UILabel = .init().then {
        $0.textColor = .pink01
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    /// 별점
    private let starLabel: UILabel = .init().then {
        $0.text = "★"
        $0.textColor = .gray02
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    private let starCount: UILabel = .init().then {
        $0.textColor = .pink01
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    /// 하단 경계선
    private let bottomBorder: UIView = .init().then {
        $0.backgroundColor = .gray01
    }
    
    // MARK: - Properties
    static let identifier: String = "EventCell"
    
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
        placeLabel.text = nil
        titleLabel.text = nil
        descLabel.text = nil
        priceLabel.text = nil
        interestCount.text = nil
        reviewCount.text = nil
        starCount.text = nil
        reservationButton.isHidden = true
    }
    
    // MARK: - Helpers
    private func configureView() {
        [
            thumbnailImageView,
            placeLabel,
            titleLabel,
            descLabel,
            reservationButton,
            heartButton,
            priceLabel,
            priceCurrency,
            interestLabel,
            interestCount,
            reviewLabel,
            reviewCount,
            starLabel,
            starCount,
            bottomBorder
        ].forEach {
            addSubview($0)
        }
        configureSubviews()
    }
    
    private func configureSubviews() {
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(10)
            $0.width.equalTo(130)
        }
        placeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-80)
            $0.height.equalTo(16)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(placeLabel.snp.bottom).offset(8)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-70)
            $0.height.equalTo(20)
        }
        descLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
        }
        reservationButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(70)
            $0.height.equalTo(20)
        }
        heartButton.snp.makeConstraints {
            $0.top.equalTo(reservationButton.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.height.equalTo(30)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descLabel.snp.bottom).offset(8)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
            $0.bottom.equalToSuperview()
        }
        priceCurrency.snp.makeConstraints {
            $0.centerY.equalTo(priceLabel)
            $0.leading.equalTo(priceLabel.snp.trailing)
        }
        interestLabel.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.equalTo(interestCount.snp.leading)
            $0.centerY.equalTo(priceLabel)
        }
        interestCount.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.equalTo(reviewLabel.snp.leading).offset(-4)
            $0.centerY.equalTo(priceLabel)
        }
        reviewLabel.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.equalTo(reviewCount.snp.leading)
            $0.centerY.equalTo(priceLabel)
        }
        reviewCount.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.equalTo(starLabel.snp.leading).offset(-4)
            $0.centerY.equalTo(priceLabel)
        }
        starLabel.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.equalTo(starCount.snp.leading)
            $0.centerY.equalTo(priceLabel)
        }
        starCount.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalTo(priceLabel)
        }
        bottomBorder.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func bind(_ data: YSEvent) {
        if let urlString = data.thumbnailImageURL,
           let url = URL(string: urlString) {
            thumbnailImageView.kf.setImage(with: url, placeholder: UIImage(named: "PlaceholderImage"))
        }
        
        placeLabel.text = data.displayName
        titleLabel.text = data.name
        descLabel.text = data.comment
        let (priceText, unitText) = NumberUtil.buildCompressedPrice(Double(data.price ?? 0))
        priceLabel.text = priceText
        priceCurrency.text = "\(unitText)\(data.currencyName ?? .원)"
        interestCount.text = NumberUtil.buildCompressedNumber(data.wishCount ?? 0)
        reviewCount.text = NumberUtil.buildCompressedNumber(data.reviewCount ?? 0)
        starCount.text = NumberUtil.buildCompressedNumber(data.rateScore ?? 0)
        
        reservationButton.isHidden = data.reservationYn == .n
    }
}
