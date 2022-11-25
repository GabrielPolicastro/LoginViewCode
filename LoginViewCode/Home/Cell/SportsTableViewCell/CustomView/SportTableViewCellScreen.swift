//
//  SportTableViewCellScreen.swift
//  LoginViewCode
//
//  Created by Gabriel Policastro on 14/10/22.
//

import UIKit

class SportTableViewCellScreen: UIView {

    lazy var collectionView: UICollectionView = {
        let collectionView =  UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())// dizendo p collection view q o estilo dele eh nativo
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false // desabilitando indicador de scrool
        collectionView.backgroundColor = .none
        collectionView.delaysContentTouches = false
        collectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: SportCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false) // adicionando o collectionView
        
        return collectionView
    }()
    
    
    // --------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate,dataSource: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
    func addSubview() {
        self.addSubview(self.collectionView)
    }

    func configConstraints() {
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
