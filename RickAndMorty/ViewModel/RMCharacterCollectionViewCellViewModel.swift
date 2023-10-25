//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 23/10/23.
//

import Foundation
final class RMCharacterCollectionViewCellViewModel {
     let characterName : String
     let characterStatus : RMCharacterStatus
     let characterImageUrl : URL?
    
    init(
        characterName : String,
        characterStatus : RMCharacterStatus,
        characterImageUrl : URL?
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    public var CharacterStatuText : String {
        return characterStatus.rawValue
    }
    public func FetchImage(completion : @escaping (Result <Data, Error>) -> Void){
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data,_, error in
            guard let data = data, error == nil else
            {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
        
    }
}
