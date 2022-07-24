//
//  CharacterCell.swift
//  Rick and Mortey
//
//  Created by Сапронов Игорь on 01.06.2022.
//

import Foundation
import UIKit
import SDWebImage

class CharacterCell: UICollectionViewCell {
    
    static let identifier = "CharacterCell"
    
    private lazy var image: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 10
        return img
    }()
    
    private lazy var nameLabel: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var lastLocationLabel: UILabel = {
        var lbl = UILabel()
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupConstraints()
    }
    
    convenience init() {
        self.init(frame: .zero)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(model: Character) {
        image.sd_setImage(with: URL(string: model.image))
        nameLabel.text = model.name
        lastLocationLabel.text = model.location.name
    }
    
    private func setupConstraints() {
        contentView.addSubview(image)
        contentView.addSubview(nameLabel)
        contentView.addSubview(lastLocationLabel)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            lastLocationLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 5),
            lastLocationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15)
        ])
    }
}
