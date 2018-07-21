//
//  Page.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation

/// Pagination operation's model object. Created as a class -not structure- because we need pass by referance abilities.
class Page {
    
    var index = 1
    
    /// Increases value of index to let us get other page items.
    func bumpUp() {
        self.index += 1
    }
    
    /// Resets index value to 1
    func reset() {
        self.index = 1
    }
}
