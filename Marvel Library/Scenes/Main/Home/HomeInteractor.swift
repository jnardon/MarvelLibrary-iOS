//
//  CharactersInteractor.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation

class HomeInteractor {
    
    // MARK: - Search Call
    
    func search(page: Page,
                result: @escaping (([Character]) -> Void),
                failure: @escaping (errorHandler) = { _ in }) {
        Networking.searchCharacters(page: page, success: { characters in
            result(characters)
        }) { error in
            failure(error)
        }
    }
}
