//
//  Image.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import ObjectMapper

struct Image: Mappable {
    
    var path: String?
    var imageExtension: String? // Extension is a reserved word :(
    
     init?(map: Map) {}
    
     mutating func mapping(map: Map) {
        self.path           <-  map["path"]
        self.imageExtension <-  map["extension"]
    }
    
    func imageURL() -> URL? {
        guard let path = self.path else { return nil }
        guard let imageExtension = self.imageExtension else { return nil }
        
        guard let url = URL(string: path.appending("/portrait_xlarge.").appending(imageExtension)) else { return nil }
        
        return url
    }
}
