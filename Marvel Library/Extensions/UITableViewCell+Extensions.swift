//
//  UITableViewCell+Extensions.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    /// Use this to get reuseIdentifier for this tableViewCell
    static var cellReuseIdentifier : String {
        return String(describing: self)
    }
}
