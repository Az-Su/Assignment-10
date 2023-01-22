//
//  MainViewController.swift
//  Assignment-10
//
//  Created by Sailau Almaz Maratuly on 22.01.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemCyan
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.typeName)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "WORK!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let images = ["china-great-wall",
                   "egypt-pyramids-giza",
                   "greece-athens-acropolis-moon",
                   "india-taj-mahal",
                   "italy-rome-colosseum",
                   "new-york-statue-of-liberty",
                   "peru-machu-picchu-overview",
                   "eiffel-tower-flowers-spring"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - Setup views and constraints methods

extension MainViewController {
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(myLabel)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.33)
        }
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - CollectionViewDataSource methods

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.typeName, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .clear
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        
        return cell
    }
}

//MARK: - CollectionViewDelegate methods

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.setImage(name: images[Int.random(in: 0..<images.count)])
    }
}

