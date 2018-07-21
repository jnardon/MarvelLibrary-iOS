//
//  Constants.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import UIKit

/// All constant values are stored here.

struct Constants {
    
    /// API constants
    struct API {
        static let key = "94e52318e49e3fdea61c5d5a258c08aa"
        static let privateKey = "4c6fffd107fb51677be5b6bea1c032829a39718c"
    }
    
    /// Url constants
    struct Url {
        static let baseURLString = "http://gateway.marvel.com"
    }
    
    /// UImage constants
    struct Image {
        static let noPhoto = UIImage(named: "image_placeholder")!
    }
}
