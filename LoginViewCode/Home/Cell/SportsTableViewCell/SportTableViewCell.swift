//
//  SportTableViewCell.swift
//  LoginViewCode
//
//  Created by Gabriel Policastro on 14/10/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    var sportTableViewCellScreen:SportTableViewCellScreen = SportTableViewCellScreen()
    var data:[Sport] = []
    
    static let identifier: String = "SportTableViewCell"
    
    
    // --------------------------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.configConstraints()
        self.sportTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // --------------------------------------------
    
    
    func addSubview() { // Metodo de adicionar
        self.sportTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportTableViewCellScreen)
    }
    
    func configConstraintsSportTableViewCellScreen() {
        self.sportTableViewCellScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
    public func dataCollection(data:[Sport]){
        self.data = data
        
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.sportTableViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportTableViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.sportTableViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.sportTableViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 130)
    }
    
    
    
    
}




