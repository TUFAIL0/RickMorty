//
//  Character.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 02/10/23.
//

import Foundation
struct RMCharacter : Codable {
    let id : Int
    let name :String
    let status: RMCharacterStatus
    let species : String
    let type : String
    let gender: RMCharacterGender
    let origin : RMOrigin
    let location : RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created : String
    
  
}
