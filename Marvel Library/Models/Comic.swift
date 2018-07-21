//
//  Comic.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import ObjectMapper

struct Comic: Mappable {
    
    var avaiable: Bool?
    var returned: Bool?
    var collectionURI: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.avaiable      <-  map["avaiable"]
        self.returned      <-  map["returned"]
        self.collectionURI <-  map["collectionURI"]
    }
}
