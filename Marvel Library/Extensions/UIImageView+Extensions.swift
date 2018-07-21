//
//  UIImageView+Extensions.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation
import AlamofireImage

extension UIImageView {
    
    func imageFromURL(url: URL?) {
        let placeholderImage = Constants.Image.noPhoto
        
        guard let url = url else {
            self.image = placeholderImage
            return
        }
        
        self.af_setImage(withURL: url, placeholderImage: placeholderImage)
    } 
}
