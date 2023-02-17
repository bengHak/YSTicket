//
//  MainFeedViewController.swift
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

public final class MainFeedViewController: UIViewController {

    // swiftlint:disalbe type_name
    typealias YSDatasource = RxCollectionViewSectionedReloadDataSource
    
    enum Item {
        case youtube([YSTv])
        case recommend(YSEvent)
        case new(YSEvent)
    }
    
    // MARK: - UI properties
    private lazy var collectionView: UICollectionView = .init(
        frame: .zero,
        collectionViewLayout: self.createCollectionViewLayout()
    ).then {
        $0.register(YSTVCollectionViewCell.self, forCellWithReuseIdentifier: YSTVCollectionViewCell.identifier)
        $0.register(EventCell.self, forCellWithReuseIdentifier: EventCell.identifier)
        $0.register(
            YoutubeHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: YoutubeHeader.identifier
        )
        $0.register(
            RecommendHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: RecommendHeader.identifier
        )
        $0.register(
            NewEventHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: NewEventHeader.identifier
        )
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
    }
    
    // MARK: - Properties
    private lazy var datasource: YSDatasource<SectionModel<Void, Item>> = self.createDatasource()
    private let disposeBag: DisposeBag = .init()
    private let viewModel: MainFeedViewModelProtocol
    
    public init(viewModel: MainFeedViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycles
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureSubviews()
        bind()
        fetchFeeds()
    }
    
    // MARK: - Helpers
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func configureSubviews() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func fetchFeeds() {
        viewModel.fetchMainFeeds()
    }
    
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
    
    // swiftlint:disable cyclomatic_complexity
    private func createDatasource() -> YSDatasource<SectionModel<Void, Item>> {
        return .init { (_, collectionView, indexPath, item) in
            switch item {
            case .youtube(let item):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: YSTVCollectionViewCell.identifier,
                    for: indexPath
                ) as? YSTVCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.bind(item)
                return cell
            case .recommend(let item):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: EventCell.identifier,
                    for: indexPath
                ) as? EventCell else {
                    return UICollectionViewCell()
                }
                cell.bind(item)
                return cell
            case .new(let item):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: EventCell.identifier,
                    for: indexPath
                ) as? EventCell else {
                    return UICollectionViewCell()
                }
                cell.bind(item)
                return cell
            }
        } configureSupplementaryView: { _, collectionView, kind, indexPath in
            switch indexPath.section {
            case 0:
                guard let reusableView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: YoutubeHeader.identifier,
                    for: indexPath
                ) as? YoutubeHeader else {
                    return UICollectionReusableView()
                }
                return reusableView
            case 1:
                guard let reusableView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: RecommendHeader.identifier,
                    for: indexPath
                ) as? RecommendHeader else {
                    return UICollectionReusableView()
                }
                return reusableView
            case 2:
                guard let reusableView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: NewEventHeader.identifier,
                    for: indexPath
                ) as? NewEventHeader else {
                    return UICollectionReusableView()
                }
                return reusableView
            default:
                return UICollectionReusableView()
            }
        }
    }
    
    private func bind() {
        bindViewModel()
        bindCollectionView()
    }
    
    private func bindViewModel() {
        Observable.combineLatest(
            viewModel.youtubeData,
            viewModel.recommendedEvent,
            viewModel.newEvent
        )
        .map { youtube, recommend, newEvent -> [SectionModel] in
            return [
                SectionModel(model: (), items: [Item.youtube(youtube)]),
                SectionModel(model: (), items: recommend.map { Item.recommend($0) }),
                SectionModel(model: (), items: newEvent.map { Item.new($0) })
            ]
        }
        .bind(to: collectionView.rx.items(dataSource: datasource))
        .disposed(by: disposeBag)
    }
    
    private func bindCollectionView() { }
}

extension MainFeedViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let deviceWidth: CGFloat = UIScreen.main.bounds.width
        switch indexPath.section {
        case 0:
            return CGSize(width: deviceWidth, height: 150.0)
        default:
            return CGSize(width: deviceWidth, height: 150.0)
        }
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 70)
    }
}
