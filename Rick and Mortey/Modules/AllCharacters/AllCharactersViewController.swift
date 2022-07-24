//
//  AllCharactersViewController.swift
//  Rick and Mortey
//
// Created by Igor Sapronov on 23.05.2022.
//

import Foundation
import UIKit

class AllCharactersViewController: UIViewController, AllCharactersPresenterToView {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(CharacterCell.self, forCellWithReuseIdentifier: String(describing: CharacterCell.self))
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    var presenter: AllCharactersViewToPresenter? {
        willSet {
            newValue?.view = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
        setupConstraints()
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    deinit {
        print("vcKilled")
    }
}

extension AllCharactersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let character = presenter?.characters[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as! CharacterCell
        cell.show(model: character!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 72)
    }
}
