//
//  RequestBuilder.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import Alamofire

/// Build request based on the selected enum.
enum RequestBuilder: URLRequestConvertible {
    
    case searchCharacter()
    
    /// URLRequestConvertible's method.
    func asURLRequest() throws -> URLRequest {
        
        /// Set case's http method.
        var method: HTTPMethod {
            switch self {
            case .searchCharacter(_):
                return .get
            }
        }
        
        /// Create URL based on the enum of request.
        let url:URL = {
            let relativePath: String?
            
            switch self {
            case .searchCharacter:
                relativePath = "/v1/public/characters"
            }
            
            var urlString = Constants.Url.baseURLString
            if let relativePath = relativePath {
                urlString.append(relativePath)
                urlString.append(self.authorizationQuery())
            }
            return URL(string: urlString)!
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest)
    }
}

extension RequestBuilder {
    func authorizationQuery() -> String {
        let timeStamp = "\(Date().hashValue)"
        
        var authorizationQuery = "?"
        authorizationQuery.append("apikey=\(Constants.API.key)")
        authorizationQuery.append("&ts=\(timeStamp)")
        authorizationQuery.append("&hash=\(self.createHash(timeStamp: timeStamp))")
        
        return authorizationQuery
    }
    
    func createHash(timeStamp: String) -> String {
        return (timeStamp + Constants.API.privateKey + Constants.API.key).md5!
    }
}
