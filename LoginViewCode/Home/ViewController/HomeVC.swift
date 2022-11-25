//
//  HomeVCViewController.swift
//  LoginViewCode
//
//  Created by Gabriel Policastro on 13/10/22.
//

import UIKit



class HomeVC: UIViewController {
    
    var homeScreen:HomeScreen?
    var dataUser: [DataUser] = [DataUser(name: "Peter Griffin", nameImage: "menino02"),
                                DataUser(name: "Stewie Griffin", nameImage: "menino01"),
                                DataUser(name: "Brian Griffin", nameImage: "cachorro")
    ]
    var dataSport:[Sport] = [Sport(name: "Corrida", nameImage: "corrida"),
                             Sport(name: "Ciclismo", nameImage: "ciclismo"),
                             Sport(name: "Natação", nameImage: "natacao"),
                             Sport(name: "Yoga", nameImage: "yoga")
                             
    ]
    
    
    
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: self.dataSport)
            return cell ?? UITableViewCell()
            
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}
