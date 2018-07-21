//
//  String+Extensions.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation


extension String {
    
    // MARK: Cryptografy
    
    var md5: String? {
        get {
            guard let messageData = self.data(using:String.Encoding.utf8) else { return nil }
            var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
            
            _ = digestData.withUnsafeMutableBytes {digestBytes in
                messageData.withUnsafeBytes {messageBytes in
                    CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
                }
            }
            
            let cString = digestData.map { String(format: "%02hhx", $0) }.joined()
            return cString
        }
    }
}
