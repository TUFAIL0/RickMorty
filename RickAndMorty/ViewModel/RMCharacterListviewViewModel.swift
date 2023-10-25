//
//  CharacterListviewViewModel.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 23/10/23.
//

import UIKit

protocol RMCharacterListviewViewModelDeletegate : AnyObject{
    func didLoadInitialCharacter()
}
final class RMCharacterListviewViewModel : NSObject{
    
    public weak var delegate : RMCharacterListviewViewModelDeletegate?
    private var cellViewModels : [RMCharacterCollectionViewCellViewModel] = []
   
    
    private var characters : [RMCharacter] = [] {
        didSet{
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName : character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                    )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    public func fetchCharacter(){
        //Initiate the network request
        RMService.shared.excute(.listCharacterRequests, expecting: RMGetAllCharacterResponse.self) { [weak self]Result in
            switch Result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters = results
                DispatchQueue.main.async{
                    // Notify the delegate the initail charachter has been loaded
                    self?.delegate?.didLoadInitialCharacter()
                }
            case.failure(let error) :
                print(String(describing: error))
                
            }
        }
    }
}
extension RMCharacterListviewViewModel : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        cell.backgroundColor = .green
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = UIScreen.main.bounds
        let width = (bound.width - 30)/2
        return CGSize(
            width: width,
            height: width * 1.5
            )
    }
}
