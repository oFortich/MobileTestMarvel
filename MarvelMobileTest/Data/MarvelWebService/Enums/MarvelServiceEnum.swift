//
//  Enums.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation


// This enum class has the two services availables
enum MarvelService {
    case characters
    case characterDetail(id: String)
    
    var basePath: String {
        "https://gateway.marvel.com:443/v1/public"
    }
    
    var servicePath: String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5.getMD5(data: "\(ts)\(privateKey)\(publicKey)")
        
        switch self {
        case .characters:
            return "/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)&limit=100"
        case .characterDetail(let id):
            return "/characters/\(id)?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        }
    }
}

// This enum is part of the error management in case of an unknown error happens
enum NetworkError: Error {
    case badURL
}
