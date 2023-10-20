//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 20/10/23.
//

import Foundation
final class RMRequest {
    private struct Constant {
        static let baseUrl  = "https://rickandmortyapi.com/api"
    }
    let endpoint : RMEndpoint
    
    let pathComponent : Set<String>
    
    let queryParameter : [URLQueryItem]
    //Construct URL for API to request in String form
    //Description : - UrlString is computed property which is use to construct URL String combining diffrent component such as endpont , pathComponenet and questyParament
    private var urlString : String {
        var string = Constant.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponent.isEmpty{
            pathComponent.forEach ({
                string += "/\($0)"
            } )
            
        }
        
        if !queryParameter.isEmpty{
            string += "?"
            let argumentString =  queryParameter.compactMap({
                guard let value = $0.value else {
                    return nil
                }
                return "\($0.name) = \(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    
    public var url : URL?{
        return URL(string: urlString)
    }
    public let httpMethod = "GET"
    init(
        endpoint: RMEndpoint,
        pathComponent : [String] = [],
        queryParameter : [URLQueryItem] = []
    )
    {
        self.endpoint = endpoint
        self.pathComponent = pathComponent
        self.queryParameter = queryParameter
    }
    
}

