//
//  AlbumsViewController.swift
//  HomeWork13
//
//  Created by Anastasia Belyakova on 10.01.2022.
//

import UIKit

class AlbumsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var models = [Models]()

    @objc func leftButtonItem(param: UIBarButtonItem) {
    }

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayouts()
        setupView()
        setupDelegates()
        setupCollectionView()
        configureSections()
        collectionView.reloadData()
    }

    // MARK: - Private functions

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayouts() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }

    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Альбомы"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(leftButtonItem(param:)) )
    }

    private func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func setupCollectionView() {
        collectionView.collectionViewLayout = createCompositionLayout()

        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.register(TableCollectionViewCell.self,
                                forCellWithReuseIdentifier: TableCollectionViewCell.identifier)
        collectionView.register(CollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CollectionReusableView.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    // MARK: - Creating layout

    func createCompositionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in

            switch sectionIndex {
            case 0: return self.myAlbumsLayoutSection()
            case 1: return self.peopleAndPlacesLayoutSection()
            case 2: return self.typesOfMediaFilesLayoutSection()
            default:
                return self.otherLayoutSection()
            }
        }
    }

    // MARK: - Creating sections

    func myAlbumsLayoutSection() -> NSCollectionLayoutSection {

        //  ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                              heightDimension: .fractionalWidth(0.93))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        //  GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.size.width*0.48),
                                               heightDimension: .absolute(view.frame.size.width*1.15))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        //  SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 15, bottom: 30, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging

        //  HEADER
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(35))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: -10, bottom: 0, trailing: 0)
        sectionHeader.pinToVisibleBounds = false
        sectionHeader.zIndex = Int.max
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    func peopleAndPlacesLayoutSection() -> NSCollectionLayoutSection {

        //  ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        //  GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.size.width*0.47),
                                               heightDimension: .absolute(view.frame.size.width*0.72))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        //  SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10)
        section.orthogonalScrollingBehavior = .groupPaging

        //  HEADER
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(25))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: -10, leading: -10, bottom: 0, trailing: 0)
        sectionHeader.pinToVisibleBounds = false
        sectionHeader.zIndex = Int.max
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    func typesOfMediaFilesLayoutSection() -> NSCollectionLayoutSection {

        //  ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .absolute(view.frame.size.width*0.13))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        //  GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.size.width),
                                               heightDimension: .absolute(view.frame.size.height))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        //  SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 30, trailing: -50)
        //section.orthogonalScrollingBehavior = .groupPaging

        //  HEADER
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(25))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0)
        sectionHeader.pinToVisibleBounds = false
        sectionHeader.zIndex = Int.max
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    func otherLayoutSection() -> NSCollectionLayoutSection {

        //  ITEM
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .absolute(view.frame.size.width*0.13))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        //  GROUP
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.size.width),
                                               heightDimension: .absolute(view.frame.size.width*0.47))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        //  SECTION
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: -20, trailing: -50)
        section.orthogonalScrollingBehavior = .groupPaging

        //  HEADER
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(25))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0)
        sectionHeader.pinToVisibleBounds = false
        sectionHeader.zIndex = Int.max
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    // MARK: - CollectionView functions

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.identifier, for: indexPath) as! CollectionReusableView

        let section = indexPath.section

        switch (section) {
        case 0:
            header.configureBothHeaders(leftheader: "Мои альбомы", rightHeader: "Все")
            return header
        case 1:
            header.configureLeftHeader("Люди и места")
            return header
        case 2:
            header.configureLeftHeader("Типы медиафайлов")
            return header
        case 3:
            header.configureLeftHeader("Другое")
            return header
        default:
            return UICollectionReusableView()
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .albumsCell(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
                cell.configure(with: model)
                cell.contentView.backgroundColor = .clear
                return cell
        case .standardCell(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as! TableCollectionViewCell
            cell.configure(with: model)
            cell.contentView.backgroundColor = .clear
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.changeSelect(color: UIColor.darkGray.withAlphaComponent(0.7))
        }
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.changeSelect(color: .clear)
        }
    }

}
