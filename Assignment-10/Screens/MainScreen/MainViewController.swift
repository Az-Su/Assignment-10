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
        collectionView.layer.cornerRadius = 12
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.typeName)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.typeName)
        tableView.allowsSelection = false
        tableView.backgroundColor = .systemYellow
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 12
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "WORK!"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let listOf = DataBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - Setup views and constraints methods

extension MainViewController {
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(tableView)
        view.addSubview(label)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(tableView.snp.top).inset(-10)
            make.height.equalTo(200)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).inset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(label.snp.top).inset(-10)
            make.height.equalTo(200)

        }

        label.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
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
        cell.setImage(name: listOf.images[Int.random(in: 0..<listOf.images.count)])
    }
}


//MARK: - TableViewDataSource methods

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.typeName, for: indexPath) as! TableViewCell
        cell.backgroundColor = .clear
        return cell
    }
}

//MARK: - TableViewDelegate methods

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
