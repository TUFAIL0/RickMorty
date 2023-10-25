//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 02/10/23.
//

import UIKit

final class RMCharacterViewController: UIViewController { //UIViewContrller is use to manage and control single screen
    
    private let characterViewList = RMCharacterListView()  //CharacterViewList instance of RMCharacterlistview Class

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Character"
        view.addSubview(characterViewList)
        setupView()
    }
    func setupView (){
        NSLayoutConstraint.activate([
            characterViewList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterViewList.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterViewList.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterViewList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
}
