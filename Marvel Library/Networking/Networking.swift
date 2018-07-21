//
//  Networking.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias errorHandler = (_ error: RequestError) -> ()

/// Networking class is a proxy between our architecture and http calls. Here Alamofire is choosen to complete calls, but in any case of change request for alamofire can be handled here easily.
class Networking {
    
    /// Requests movies using a query param
    ///
    /// - parameter page: lets us handle pagination
    /// - parameter success: closure to handle succeed case
    /// - parameter failure: closure to handle failure case
    /// - Returns: Nothing. Callbacks does what to be done after async call.
    class func searchCharacters(page: Page,
                            success: @escaping ((_ result: [Character]) -> ()),
                            failure: @escaping (errorHandler) = { _ in }) {
        Alamofire.request(RequestBuilder.searchCharacter()).responseObject { (response: DataResponse<CharactersResponse>) in
            
            if let error = response.error {
                failure(RequestError(title: error.localizedDescription, description: "", code: error._code))
                return
            }
            
            guard let characters = response.result.value?.data?.results else {
                return
            }
            
            guard characters.count > 0 else {
                failure(RequestError(title: "This query has no data", description: "", code: 100))
                return
            }
            
            success(characters)
        }
    }
    
}
