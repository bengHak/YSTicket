//
//  YoutubeListViewController.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/02/17.
//  Copyright © 2023 kr.byunghak. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import SafariServices
import SnapKit
import Then
import UIKit

import DomainKit

final class YoutubeListViewController: UIViewController {
    
    // swiftlint:disalbe type_name
    typealias YSDatasource = RxCollectionViewSectionedReloadDataSource
    typealias Item = YSTv
    
    // MARK: - UI properties
    private lazy var collectionView: UICollectionView = .init(
        frame: .zero,
        collectionViewLayout: self.createLayout()
    ).then {
        $0.register(YSTVCell.self, forCellWithReuseIdentifier: YSTVCell.identifier)
    }
    
    // MARK: - Properties
    private lazy var datasource: YSDatasource<SectionModel<Void, Item>> = self.createDatasource()
    private let disposeBag: DisposeBag = .init()
    private let viewModel: YoutubeListViewModelProtocol
    
    // MARK: - Lifecycles
    init(youtubeData: BehaviorRelay<[YSTv]>) {
        self.viewModel = YoutubeListViewModel(youtubeData: youtubeData)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureSubviews()
        bind()
    }
    
    // MARK: - Helpers
    private func configureView() {
        title = "여신TV 인기영상"
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func configureSubviews() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func createLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width: CGFloat = (UIScreen.main.bounds.width / 2)
        let height: CGFloat = width * 0.8
        layout.itemSize = CGSize(width: width, height: height)
        return layout
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
    
    private func bind() {
        bindViewModel()
        bindCollectionView()
    }
    
    private func bindViewModel() {
        viewModel.youtubeData
            .map { [SectionModel(model: (), items: $0)] }
            .bind(to: collectionView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)
    }
    
    private func bindCollectionView() {
        collectionView.rx.modelSelected(YSTv.self)
            .bind { [weak self] (ystv: YSTv) in
                guard let self,
                      let urlString = ystv.tvVideoURL,
                      let url = URL(string: urlString) else {
                    return
                }
                let sfVC: SFSafariViewController = .init(url: url)
                self.navigationController?.pushViewController(sfVC, animated: true)
            }.disposed(by: disposeBag)
    }
}
