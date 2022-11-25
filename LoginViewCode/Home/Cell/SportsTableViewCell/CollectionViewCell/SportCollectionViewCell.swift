//
//  SportCollectionViewCell.swift
//  LoginViewCode
//
//  Created by Gabriel Policastro on 14/10/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    let sportCollectionViewCellScreen: SportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    static let identifier: String = "SportCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configConstraints()
    }
    
    public func setUpCell(data: Sport){
        self.sportCollectionViewCellScreen.imageView.image = UIImage(named: data.nameImage)
        self.sportCollectionViewCellScreen.sportName.text = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.sportCollectionViewCellScreen.layer.borderWidth = 6.0
        self.sportCollectionViewCellScreen.layer.borderColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0).cgColor
        self.sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportCollectionViewCellScreen)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.sportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.sportCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
