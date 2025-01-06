### 📚 GottaCatchEmAll: Pokémon 도감 앱

---

## 🍀 소개

**Pokémon 도감 앱**은 iOS에서 포켓몬 데이터를 효율적으로 관리하고 시각적으로 표현하기 위한 앱입니다. 포켓몬 데이터를 불러오고, 스크롤 가능한 도감을 통해 포켓몬 정보를 확인할 수 있습니다. 앱은 **MVVM 패턴**과 **RxSwift**를 활용해 구조화되어 있으며, [Pokémon API](https://pokeapi.co/)를 사용해 데이터를 동적으로 로드합니다.

---

## ✨ 주요 기능

1. **포켓몬 목록 보기**
    - `UICollectionView`를 사용해 포켓몬 데이터를 세로 스크롤로 표시.
    - 포켓몬 정보: 이름, 이미지.
2. **포켓몬 무한 스크롤**
    - 스크롤 시 추가 데이터를 동적으로 불러와 도감 확장.
3. **포켓몬 상세 정보 보기**
    - 포켓몬을 선택하면 이름, 타입, 키, 몸무게 등 상세 정보를 확인 가능.
4. **API 통신**
    - [Pokémon API](https://pokeapi.co/)를 활용해 포켓몬 데이터를 동적으로 불러옴.

---

## 📂 프로젝트 구조 (MVVM)

```sql
📆 GottaCatchEmAll
├── 📂 Model
│   ├── 📄 PokemonDetail.swift
│   ├── 📄 PokemonList.swift
│   ├── 📄 PokemonTranslator.swift
│   ├── 📄 PokemonTypeName.swift
├── 📂 View
│   ├── 📂 Main
│   │   ├── 📄 MainViewController.swift
│   │   └── 📄 PokemonCell.swift
│   ├── 📂 Detail
│   │   └── 📄 DetailViewController.swift
├── 📂 ViewModel
│   ├── 📄 MainViewModel.swift
│   ├── 📄 DetailViewModel.swift
├── 📂 Network
│   ├── 📄 NetworkManager.swift
│   ├── 📄 PokemonAPI.swift
├── 📂 App
│   ├── 📄 AppDelegate.swift
│   ├── 📄 SceneDelegate.swift
├── 📂 Extension
│   ├── 📄 UIColor+Custom.swift
│   ├── 📄 UIStackView+AddArrangedSubviews.swift
│   ├── 📄 UIView+AddSubviews.swift
├── 📂 Resources
│   ├── 🎨 Assets.xcassets
│   ├── 📋 Info.plist
│   └── 🖥️ LaunchScreen.storyboard

```

---

## 💡 사용 기술

- **Swift 5**
- **UIKit**: UI 컴포넌트 활용 및 화면 구성.
- **SnapKit**: 코드 기반 레이아웃 관리.
- **RxSwift**: 비동기 데이터 스트림 및 바인딩.
- **Moya**: 네트워크 요청 관리.
- **Pokemon API**: 포켓몬 데이터 제공.

---

## 🔧 요구사항

- **Xcode 버전**: 16.1 이상
- **iOS 지원 버전**: iOS 16.0 이상
- **Swift 버전**: Swift 5 이상

---

## 🚀 실행 방법

1. **프로젝트 클론**
    
    GitHub에서 프로젝트를 클론합니다.
    
    ```bash
    git clone https://github.com/daydreamplace/GottaCatchEmAll.git
    cd GottaCatchEmAll
    ```
    
2. **Xcode에서 열기**
    
    Xcode에서 프로젝트 폴더를 엽니다.
    
3. **시뮬레이터 실행**
    
    Xcode에서 빌드 타겟을 선택하고, iOS 시뮬레이터에서 실행합니다.
    

---

## 💻 실행 화면

| 포켓몬 목록 | 포켓몬 상세 정보 | 무한 스크롤 |
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/0335b800-251f-4713-9abc-3d8469d29c35" width="250"> | <img src="https://github.com/user-attachments/assets/fa16a318-a027-4fd9-ae1f-e8575a82e348" width="250"> | <img src="https://github.com/user-attachments/assets/f7196487-dc66-4642-a136-8fa15eb507bd" width="250"> |


## 🛠 트러블슈팅

**트러블슈팅과 배운점**은 [여기](https://velog.io/@daydreamplace/Gotta-Catchem-All)에서 확인할 수 있습니다.

---

## 📚 프로젝트를 통해 배운 점

- **MVVM 아키텍처**를 활용해 관심사를 분리.
- **RxSwift**로 비동기 데이터 바인딩 및 이벤트 처리 경험.
- **API 통신** 및 데이터 파싱, UI 업데이트 경험.
- **무한 스크롤**을 통해 효율적인 데이터 로딩 구현.

---

## 🖇️ 레퍼런스

- [Pokemon API 공식 문서](https://pokeapi.co/)
- [RxSwift GitHub](https://github.com/ReactiveX/RxSwift)
- [SnapKit 공식 문서](https://snapkit.io/docs/)
- [Swift Documentation](https://swift.org/documentation/)
