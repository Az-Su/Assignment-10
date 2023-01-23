//
//  TableViewCell.swift
//  Assignment-10
//
//  Created by Sailau Almaz Maratuly on 22.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {    
    private lazy var itemCollectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 175)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.typeName)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let listOf = DataBase()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        itemCollectioView.dataSource = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup views and constraints methods

private extension TableViewCell {
    func setupViews() {
        contentView.addSubview(itemCollectioView)
    }
    
    func setupConstraints() {
        itemCollectioView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - CollectionViewDataSource methods

extension TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.typeName, for: indexPath) as! CollectionViewCell
        cell.setImage(name: listOf.images[Int.random(in: 0..<listOf.images.count)])
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        return cell
    }
}
