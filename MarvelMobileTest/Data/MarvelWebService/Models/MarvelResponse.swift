//
//  MarvelResponse.swift
//  MarvelTest
//
//  Created by M1 Mac on 4/07/22.
//

import Foundation

// MARK: - MarverResponse
struct MarvelResponse: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [MarvelCharacterResponse]
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    init() {
        self.path = String()
        self.ext = String()
    }
}

// MARK: - Result
struct MarvelCharacterResponse: Codable {
    let id: Int
    let name, resultDescription: String
    let thumbnail: Thumbnail


    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case thumbnail
    }
    
    init() {
        self.id = 0
        self.name = String()
        self.resultDescription = String()
        self.thumbnail = Thumbnail()
    }
}

// Extension func to map Data model into Domain model
extension MarvelCharacterResponse {
    func toMarvelCharacter() -> MarvelCharacter{
        var marvelCharacter = MarvelCharacter()
        marvelCharacter.name = name
        marvelCharacter.id = id
        marvelCharacter.resultDescription = resultDescription
        marvelCharacter.thumbnail.path = thumbnail.path
        marvelCharacter.thumbnail.ext = thumbnail.ext
        
        return marvelCharacter
    }
}
