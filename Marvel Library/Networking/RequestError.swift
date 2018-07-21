//
//  RequestError.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation

/// Custom error to handle as we want.
protocol RequestErrorProtocol: Error {
    
    var title: String { get }
    var description: String { get }
    var code: Int { get }
    
}

struct RequestError: RequestErrorProtocol {
    
    var title: String
    var description: String
    var code: Int
    
    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self.description = description
        self.code = code
    }
    
}

