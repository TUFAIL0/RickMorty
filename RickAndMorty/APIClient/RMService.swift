//
//  RMService.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 20/10/23.
//


//Utility class to make api class
import Foundation
final class RMService {
    
    //shared is singleton class , only 1 instance of RMService can exist with application
    static let shared = RMService()
    
    //privatized Constructor
    private init(){
        
    }
    
    enum RMServiceError : Error {
        case failedToCreateRequest
        case failedToGetData
    }
    //Send RickAndMorty an Api Call
    ///-Parameter
    ///  request : Request instance
    ///    type : type of object we ecpec to get back
    ///    completion :  Callback with data or error
    public func excute<T: Codable>(_ request : RMRequest , expecting type : T.Type ,completion :@escaping (Result<T, Error>)-> Void){
        guard let UrlRequest = self.request(from: request) else
        {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: UrlRequest) {data, _,error in
            guard let data = data , error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            // Decode Response
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                
            }catch{
                completion(.failure(error))
                
            }
        }
        task.resume()
    }
    // converting the request into URL request
    private func request(from rmRequest : RMRequest) ->URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request  = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
        
    }
}

