//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 23/10/23.
//

import UIKit
//This class is use to display the list of charchter
class RMCharacterListView: UIView {
    
    //View that handle showing charachter loader etc
    
    private let viewModel = RMCharacterListviewViewModel()
    
    //create the instance of UIActivityIndicatorView configures it to hide when stopped, and ensures it can be positioned using Auto Layout constraints when added to a view.
    let spinner :UIActivityIndicatorView = {
        let spinner =  UIActivityIndicatorView(style: .large)
    spinner.hidesWhenStopped = true
    spinner.translatesAutoresizingMaskIntoConstraints = false
    return spinner
}() // closure based initialization
    //UI collection help to present the content in grid format
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0 //alpha make collectionView complete transparent
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(RMCharacterCollectionViewCell.self , forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        return collectionView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
        addSubviews(collectionView, spinner)
        addConstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharacter()
        setupCollectionView()
    }
    required init?(coder : NSCoder) {
        fatalError("unsupported")
    }
    private  func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
    ])
    }
    private func setupCollectionView(){
        
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4){
                self.collectionView.alpha = 1
            }
            
            
        })
        
    }
}
extension RMCharacterListView : RMCharacterListviewViewModelDeletegate{
    func didLoadInitialCharacter() {
        collectionView.reloadData()
        
    }
}
