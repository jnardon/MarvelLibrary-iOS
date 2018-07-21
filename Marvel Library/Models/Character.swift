//
//  Character.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import ObjectMapper

struct Character: Mappable {
    
    var id: Int?
    var name: String?
    var description: String?
    var modified: Date?
    var resourceURI: String?
    var urls: [URL]?
    var thumbnail: Image?
    var comics: [Comic]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.id          <-  map["id"]
        self.name        <-  map["name"]
        self.description <-  map["description"]
        self.modified    <-  map["modified"]
        self.resourceURI <-  map["resourceURI"]
        self.urls        <-  map["urls"]
        self.thumbnail   <-  map["thumbnail"]
        self.comics      <-  map["comics"]
    }
    
}
