//
//  CharacterTableViewCell.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterIdLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!

    var character: Character?
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Population

    func populateCell(with character: Character) {
        self.character = character
        
        self.characterNameLabel.text = character.name
        self.characterIdLabel.text = "\(String(describing: character.id!))"
        self.characterDescriptionLabel.text = character.description
        self.characterImageView.imageFromURL(url: character.thumbnail?.imageURL()!)
    }
}
