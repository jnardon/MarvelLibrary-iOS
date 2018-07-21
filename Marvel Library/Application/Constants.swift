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
        static let key = "2696829a81b1b5827d515ff121700838"
    }
    
    /// Url constants
    struct Url {
        static let baseURLString = "http://api.themoviedb.org/3"
        static let posterBaseUrl = "http://image.tmdb.org/t/p/w185"
    }
    
    /// UImage constants
    struct Image {
        static let noPhoto = UIImage(named: "noPhoto")!
    }
    
    /// UITableViewCell identifier constants which are not custom class
    struct CellName {
        static let basicCell = "BasicCell"
    }
    
    /// UserDefaults key constants
    struct UserDefaultsKey {
        static let queries = "queryList"
    }
    
    /// Placeholder texts
    struct Placeholder {
        static let searchBar = "Type to search a movie"
    }
    
}
