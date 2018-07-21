//
//  CharactersView.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation

protocol CharactersView: class {
    
    func startLoading()
    func finishLoading()
    func setCharacters(characters: [Character], shouldReset: Bool)
    func setPositiveQueries(queries: [String])
    func showAlert(title: String, description: String)
    
}
