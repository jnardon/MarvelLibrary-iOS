//
//  Data.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import ObjectMapper

struct DataCharacater: Mappable {
    
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [Character]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.offset  <-  map["offset"]
        self.limit   <-  map["limit"]
        self.total   <-  map["total"]
        self.count   <-  map["count"]
        self.results <-  map["results"]
    }
}
