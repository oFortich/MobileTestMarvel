//
//  MD5.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation
import CryptoKit

class MD5 {
    
    static func getMD5(data: String) -> String {
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        return hash.map{
            String(format: "%02hhx", $0)
        }.joined()
    }
    
}
