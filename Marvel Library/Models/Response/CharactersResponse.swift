//
//  CharactersResponse.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import ObjectMapper

struct CharactersResponse: Mappable {
    
    var code: Int?
    var status: String?
    var data: DataCharacater?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        code    <-  map["code"]
        status  <-  map["status"]
        data    <-  map["data"]
    }
    
}

