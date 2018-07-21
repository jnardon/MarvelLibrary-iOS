//
//  CharacterDetailViewController.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let character = self.character {
            self.title = character.name
        }
    }
}
