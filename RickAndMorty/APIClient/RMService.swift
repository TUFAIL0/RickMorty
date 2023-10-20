//
//  RMService.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 20/10/23.
//

import Foundation
final class RMService {
    static let shared = RMService()
    
    //privatized Constructor
    private init(){
        
    }
    //Send RickAndMorty an Api Call
    ///-Parameter
    ///  request : Request instance
    ///    type : type of object we ecpec to get back
    ///    completion :  Callback with data or error
    public func excute<T: Codable>(_ request : RMRequest , expecting type : T.Type ,completion :@escaping ()-> Void){
        
    }
}

