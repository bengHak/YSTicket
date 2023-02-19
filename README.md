# 패스트레인 과제

## 개요
- MVVM 클린아키텍처 사용
- Tuist를 활용해서 클린아키텍처의 각 레이어 모듈화
- 여신티비, 추천이벤트, 신규이벤트를 섹션으로 갖는 UICollectionView 사용
  - RxDatasources 활용
  - UICollectionViewCompositionalLayout 활용하면 가로 스크롤과 세로스크롤을 한 콜렉션뷰에 구현할 수 있지만 최소 지원 버전이 iOS13이기 때문에 사용하지 못함
  - 여신티비 섹션의 가로스크롤을 구현하기 위해 해당 셀에 가로 스크롤 UICollectionView를 넣어서 구현함
- 작업 중 Mock API 사용량 초과로 API 결과값을 json 파일로 저장해서 사용
- 코드의 일관성을 위해서 SwiftLint 사용

## 의존성
- RxSwift ~> 6.5.0
- RxDataSources ~> 5.0.2
- Then ~> 3.0.0
- Swinject ~> 2.8.3
- SnapKit ~> 5.6.0
- Kingfisher ~> 6.3.1 (iOS 10+, 최신버전은 iOS12부터 지원해서 사용하지 않았음)
- Moya ~> 15.0.3

## How to run

1. Installing the Tuist
```
bash <(curl -Ls https://install.tuist.io)
```

2. Dependency package fetch
```
tuist fetch
```

3. Open Workspace
```
tuist generate
```

4. Build and run
```
// Run Simulator
1. Build "YSTicketApp" and run it on the simulator

// Run on device
2-1. Select a team from the "Signing & Capabilities" of the "YSTicketApp" target of the "YSTicketApp" project.
2-2. Run "YSTicketApp" on a practical machine.
```

## Reference 
- https://github.com/minsOne/iOSApplicationTemplate
- https://github.com/havilog/HaviTemplateApp
- https://github.com/stripe/stripe-ios
