//
//  YSTVCollectionViewCell.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/17.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import Kingfisher
import RxCocoa
import RxDataSources
import RxSwift
import SnapKit
import Then
import UIKit

import DomainKit

final class YSTVCollectionViewCell: UICollectionViewCell {
    // swiftlint:disalbe type_name
    typealias YSDatasource = RxCollectionViewSectionedReloadDataSource
    typealias Item = YSTv
    
    // MARK: - UI properties
    private lazy var collectionView: UICollectionView = .init(
        frame: .zero,
        collectionViewLayout: self.createCollectionViewLayout()
    ).then {
        $0.register(YSTVCell.self, forCellWithReuseIdentifier: YSTVCell.identifier)
        $0.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Properties
    static let identifier: String = "YSTVCollectionViewCell"
    private let disposeBag: DisposeBag = .init()
    private let youtubeList: BehaviorRelay<[YSTv]> = .init(value: [])
    private lazy var datasource: YSDatasource<SectionModel<Void, Item>> = self.createDatasource()
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func createCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 150)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }
    
    private func configureView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        youtubeList
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: collectionView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)
    }
    
    private func createDatasource() -> YSDatasource<SectionModel<Void, Item>> {
        return .init { _, collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: YSTVCell.identifier,
                for: indexPath
            ) as? YSTVCell else {
                return UICollectionViewCell()
            }
            cell.bind(item)
            return cell
        }
    }
    
    func bind(_ data: [YSTv]) {
        youtubeList.accept(data)
    }
}
